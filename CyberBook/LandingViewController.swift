//
//  LandingViewController.swift
//  CyberBook
//
//  Created by Ada Wong on 21/10/2017.
//  Copyright © 2017 Ada Wong. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        openLoginPage()
        openKeyPage()
    }
    
    func openLoginPage() {
//        openKeyPage()
    }
    
    func openKeyPage() {
        performSegue(withIdentifier: "Key", sender: self)
    }
    
}
