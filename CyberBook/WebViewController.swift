//
//  WebViewController.swift
//  CyberBook
//
//  Created by Ada Wong on 22/10/2017.
//  Copyright © 2017 Ada Wong. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: BaseViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadContent()
    }
    
    func loadContent() {
        let htmlString = """
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<p><iframe src="https://webchat.botframework.com/embed/MoBcub?s=ruMevKg-t8M.cwA.h6w.4r2fA17Nw-pIN37qonYaVFIfb5QItUwy_o2hr4ROxRQ" width="100%" height="100%"></iframe></p>
"""
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
    
}
