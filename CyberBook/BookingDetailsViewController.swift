//
//  BookingDetailsViewController.swift
//  CyberBook
//
//  Created by Ada Wong on 21/10/2017.
//  Copyright © 2017 Ada Wong. All rights reserved.
//

import UIKit
import Alamofire

class BookingDetailsViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        payButton.isEnabled = false
        hideLoading()
    }
    
    @IBOutlet weak var loadingView: UIView!
    
    func showLoading() {
        loadingView.superview?.bringSubview(toFront: loadingView)
        loadingView.isHidden = false
    }
    
    func hideLoading() {
        loadingView.isHidden = true
    }
    
    var timeSelectedRow: Int? = nil
    var timeString: String? = nil
    var selectedDate: Date? = nil
    var dateString: String? = nil
    var priceString: String? = nil
    @IBOutlet weak var payButton: UIButton!
    
    @IBAction func unwindToBookingDetails(_ storyboardSegue: UIStoryboardSegue) {
        if let vc = storyboardSegue.source as? TimeSelectionViewController {
            if let row = vc.selectedRow {
                timeCell?.detailTextLabel?.text = vc.timeSlots[row]
                timeString = vc.timeSlots[row]
            } else {
                print("selected time row: \(vc.selectedRow ?? -1)")
                timeString = nil
            }
            timeSelectedRow = vc.selectedRow
        } else if let vc = storyboardSegue.source as? DateSelectionViewController {
            selectedDate = vc.datePicker.date
            if let selectedDate = selectedDate {
                let formatter = DateFormatter()
                formatter.dateStyle = .medium
                dateString = formatter.string(from: selectedDate)
            } else {
                dateString = nil
            }
            dateCell?.detailTextLabel?.text = dateString
        }
        
        if timeSelectedRow != nil && selectedDate != nil {
            priceString = "$56"
            priceCell?.detailTextLabel?.text = priceString
            payButton.isEnabled = true
        } else {
            priceString = "-"
            priceCell?.detailTextLabel?.text = "-"
            payButton.isEnabled = false
        }
        
        tableView.reloadData()
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    weak var dateCell: UITableViewCell? = nil
    weak var timeCell: UITableViewCell? = nil
    weak var priceCell: UITableViewCell? = nil
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(indexPath.row)", for: indexPath)
        if indexPath.row == 0 {
            dateCell = cell
            dateCell?.detailTextLabel?.text = dateString
        } else if indexPath.row == 1 {
            timeCell = cell
            timeCell?.detailTextLabel?.text = timeString
        } else {
            priceCell = cell
            priceCell?.detailTextLabel?.text = priceString
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    @IBAction func payButtonTapped(_ sender: Any) {
        showLoading()
        request(path: "", method: .post) { (response, error) in
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.hideLoading()
                self.showPaymentSuccessAlert()
//            }
        }
    }
    
    func showPaymentSuccessAlert() {
        let alert = UIAlertController(title: "Success", message: "You booking is confirmed.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.openSummaryPage()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func openSummaryPage() {
        performSegue(withIdentifier: "Summary", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Summary" {
            let vc = segue.destination as! BookingSummaryViewController
            vc.dateString = dateString!
            vc.timeString = timeString!
            vc.priceString = priceString
        }
    }
    
    // MARK: - General
    
    let baseURLString = "http://52.229.164.80:3000/api"
    
    func request(path: String, method: HTTPMethod, parameters: [String: AnyObject]? = nil, encoding: URLEncoding? = .default, headers: [String: String]? = nil, _ completion: @escaping (_ response: DataResponse<Any>, _ error: Error?) -> Void) {
        guard let selectedDate = selectedDate, let timeSelectedRow = timeSelectedRow else { return }
        
        let urlString = "\(baseURLString)/v1/facilities/1/facility_bookings.json"
        
        var params: [String: AnyObject] = [:]
        params["id"] = 1 as AnyObject
        let currentDate = (Int(selectedDate.timeIntervalSince1970) / 86400 * 86400) + 86400
        let ts = currentDate + (timeSelectedRow * 3600) - (8 * 3600)
        params["facility_booking[first_time_slot]"] = ts as AnyObject
        params["facility_booking[last_time_slot]"] = ts as AnyObject
        
        print("\(#function): \(urlString), method: \(method), params: \(params)")
        
        Alamofire.request(urlString, method: method, parameters: params, encoding: URLEncoding.default, headers: nil).validate()
            .responseJSON(queue: nil, options: .allowFragments) { (response: DataResponse<Any>) in
                print("\(#function): params: \(params), response: \(response)")
                completion(response, nil)
        }
    }
    
}
