//
//  UnlockViewController.swift
//  CyberBook
//
//  Created by Ada Wong on 22/10/2017.
//  Copyright © 2017 Ada Wong. All rights reserved.
//

import UIKit

class UnlockViewController: BaseViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var keyTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgView.backgroundColor = UIColor(red: 0, green: 1, blue: 1, alpha: 1)
        
        titleLabel.text = keyTitle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
