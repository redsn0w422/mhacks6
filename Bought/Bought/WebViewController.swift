//
//  WebViewController.swift
//  Bought
//
//  Created by Niraj  on 9/12/15.
//  Copyright (c) 2015 Yasha Mostofi. All rights reserved.
//

import Foundation
import UIKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidAppear(animated: Bool) {
        let myHTMLString: String! = "<h1>Hello Pizza!</h1>"
        webView.loadHTMLString(myHTMLString, baseURL: nil)
    }
}