//
//  TimeSelectionViewController.swift
//  CyberBook
//
//  Created by Ada Wong on 22/10/2017.
//  Copyright © 2017 Ada Wong. All rights reserved.
//

import UIKit

class TimeSelectionViewController: BaseTableViewController {
    
    weak var selectedCell: UITableViewCell?
    
    var selectedRow: Int? = nil
    
    var timeSlots: [String] = {
        return [
            "00:00 - 00:59",
            "01:00 - 01:59",
            "02:00 - 02:59",
            "03:00 - 03:59",
            "04:00 - 04:59",
            "05:00 - 05:59",
            "06:00 - 06:59",
            "07:00 - 07:59",
            "08:00 - 08:59",
            "09:00 - 09:59",
            "10:00 - 10:59",
            "11:00 - 11:59",
            "12:00 - 12:59",
            "13:00 - 13:59",
            "14:00 - 14:59",
            "15:00 - 15:59",
            "16:00 - 16:59",
            "17:00 - 17:59",
            "18:00 - 18:59",
            "19:00 - 19:59",
            "20:00 - 20:59",
            "21:00 - 21:59",
            "22:00 - 22:59",
            "23:00 - 23:59",
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.accessoryType = .none
        cell.textLabel?.text = timeSlots[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCell?.accessoryType = .none
        let thisCell = tableView.cellForRow(at: indexPath)
        thisCell?.accessoryType = .checkmark
        selectedCell = thisCell
        selectedRow = indexPath.row
    }
    
}
