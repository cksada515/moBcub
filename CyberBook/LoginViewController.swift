//
//  LoginViewController.swift
//  CyberBook
//
//  Created by Ada Wong on 21/10/2017.
//  Copyright © 2017 Ada Wong. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for textField in [emailTextField, passwordTextField] as [UITextField] {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        }
        loginButton.layer.cornerRadius = 4
    }
    
    @IBAction func loginButtonTapped(_ sender: Any?) {
        // TODO: log in API
        performSegue(withIdentifier: "Key", sender: self)
    }
    
}
