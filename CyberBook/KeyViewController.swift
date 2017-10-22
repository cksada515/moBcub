//
//  KeyViewController.swift
//  CyberBook
//
//  Created by Ada Wong on 21/10/2017.
//  Copyright © 2017 Ada Wong. All rights reserved.
//

import UIKit

class KeyViewController: BaseViewController {
    
    enum Key {
        case home, work, ticket
    }
    
    @IBOutlet weak var homeKeyButton: UIButton!
    @IBOutlet weak var workKeyButton: UIButton!
    @IBOutlet weak var ticketKeyButton: UIButton!
    @IBOutlet var keyButtons: [UIButton]!
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var keyPlaceholderView: UIView!
    @IBOutlet weak var keyImageView: UIImageView!
    @IBOutlet weak var keyNameLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for btn in keyButtons {
            btn.tintColor = Theme.Color.primary
            btn.addTarget(self, action: #selector(keyButtonTapped(_:)), for: .touchUpInside)
        }
        keyButtonTapped(homeKeyButton)
        menuButton.layer.cornerRadius = 30
        menuButton.clipsToBounds = true
    }
    
    @objc func keyButtonTapped(_ sender: UIButton) {
        for btn in keyButtons {
            btn.isSelected = btn == sender
        }
        selectKey(keyOfBtn(sender))
    }
    
    func selectKey(_ key: Key) {
        let selectedBtn = btnOfKey(key)
        for btn in keyButtons {
            btn.layer.cornerRadius = 8
            if btn == selectedBtn {
                btn.layer.borderWidth = 1
                btn.layer.borderColor = UIColor.clear.cgColor
                btn.backgroundColor = Theme.Color.primary
            } else {
                btn.layer.borderWidth = 1
                btn.layer.borderColor = Theme.Color.primary.withAlphaComponent(0.3).cgColor
                btn.backgroundColor = UIColor.clear
            }
            switch key {
            case .home:
                keyImageView.image = UIImage(named: "Home")
                keyNameLabel.text = "Home"
            case .work:
                keyImageView.image = UIImage(named: "work")
                keyNameLabel.text = "Work"
            case .ticket:
                keyImageView.image = UIImage(named: "Ticket")
                keyNameLabel.text = "Ticket"
            }
        }
    }
    
    func btnOfKey(_ key: Key) -> UIButton {
        switch key {
        case .home: return homeKeyButton
        case .work: return workKeyButton
        case .ticket: return ticketKeyButton
        }
    }
    
    func keyOfBtn(_ btn: UIButton) -> Key {
        switch btn {
        case homeKeyButton: return .home
        case workKeyButton: return .work
        case ticketKeyButton: return .ticket
        default: return .home
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Unlock" {
            let vc = segue.destination as! UnlockViewController
            vc.keyTitle = self.keyNameLabel.text
        }
    }
    
    @IBAction func unlock(_ sender: Any) {
        performSegue(withIdentifier: "Unlock", sender: self)
        
//        EmperorKeyViewController.prepareForOpening(completion: { (audioAuthorizationStatus) in
//
//            switch audioAuthorizationStatus {
//            case .denied:
//                let alert = UIAlertController(title: "Alert", message: "microphone access is required", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { (action) in
//                    guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else { return }
//                    if UIApplication.shared.canOpenURL(settingsUrl) {
//                        if #available(iOS 10.0, *) {
//                            UIApplication.shared.open(settingsUrl, completionHandler: nil)
//                        } else {
//                            UIApplication.shared.openURL(settingsUrl)
//                        }
//                    }
//                }))
//                self.present(alert, animated: true)
//
//            case .firstTimeGranted, .granted:
//                let keyVC = EmperorKeyViewController.viewController()
//                keyVC.keyName = self.keyNameLabel.text
//                keyVC.textFont = UIFont.systemFont(ofSize: 17)
//                keyVC.instructionText = "Please place your phone near the lock"
//                keyVC.isShowInstruction = true
//                keyVC.expiredInSeconds = 300
//                keyVC.delegate = self
//                self.present(keyVC, animated: false)
//
//            case .firstTimeDenied:
//                break;
//
//            default:
//                break;
//            }
//
//        })
    }
}
