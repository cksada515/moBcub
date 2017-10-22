//
//  BookingSummaryViewController.swift
//  CyberBook
//
//  Created by Ada Wong on 22/10/2017.
//  Copyright © 2017 Ada Wong. All rights reserved.
//

import UIKit

class BookingSummaryViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    var dateString: String!
    var timeString: String!
    var priceString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func payButtonTapped(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.showPaymentSuccessAlert()
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
        
    }

}
