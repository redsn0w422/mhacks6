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
    @IBOutlet weak var webView: UIWebView!
    
    var url:String?
    
    override func viewDidAppear(animated: Bool) {
        self.webView?.loadRequest(NSURLRequest(URL: NSURL(string: self.url!)!))        
    }
}