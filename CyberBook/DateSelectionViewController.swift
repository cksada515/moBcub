//
//  DateSelectionTableViewController.swift
//  CyberBook
//
//  Created by Ada Wong on 22/10/2017.
//  Copyright © 2017 Ada Wong. All rights reserved.
//

import UIKit

class DateSelectionViewController: BaseViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.minimumDate = Date()
    }
    
}
