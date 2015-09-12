//
//  WebViewController.swift
//  Bought
//
//  Created by Niraj Pant on 9/12/15.
//  Copyright (c) 2015 Yasha Mostofi. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class WebViewController: UIViewController {
    var myRootRef = Firebase(url:"https://bought.firebaseio.com")
    var url:String?

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var dollarAmountField: UITextField!
    @IBAction func addProductButton(sender: AnyObject) {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.webView?.loadRequest(NSURLRequest(URL: NSURL(string: self.url!)!))
    }
}