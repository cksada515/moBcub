//
//  MenuViewController.swift
//  CyberBook
//
//  Created by Ada Wong on 21/10/2017.
//  Copyright © 2017 Ada Wong. All rights reserved.
//

import UIKit

class MenuViewController: BaseViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.layer.cornerRadius = 53
        profileImageView.clipsToBounds = true
    }
    
    @IBAction func unwindToMenu(_ storyboardSegue: UIStoryboardSegue) {
        
    }
    
}
