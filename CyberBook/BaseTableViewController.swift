//
//  BaseTableViewController.swift
//  CyberBook
//
//  Created by Ada Wong on 22/10/2017.
//  Copyright © 2017 Ada Wong. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Close
    
    @IBOutlet weak var closeButton: UIButton?
    @IBOutlet weak var closeBarButtonItem: UIBarButtonItem?
    
    func setupCloseControls() {
        var isRoot = true
        if let navigationController = navigationController, navigationController.viewControllers.count > 1 {
            isRoot = false
        }
        let closeImageNameKey = isRoot ?  "close" : "back"
        let closeImage = UIImage(named: closeImageNameKey)
        closeButton?.setImage(closeImage, for: .normal)
        closeBarButtonItem?.image = closeImage
    }
    
    @IBAction func closeButtonTapped(_ sender: Any?) {
        navigateToPreviousScene()
    }
    
    private func navigateToPreviousScene() {
        if let navigationController = navigationController {
            if navigationController.viewControllers.count == 1 {
                navigationController.dismiss(animated: true, completion: nil)
            } else {
                navigationController.popViewController(animated: true)
            }
        } else {
            dismiss(animated: true, completion: nil)
        }
    }

}
