//
//  WebViewController.swift
//  Bought
//
//  Created by Niraj Pant on 9/12/15.
//  Copyright (c) 2015 Yasha Mostofi. All rights reserved.
//

import Foundation
import UIKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    var url:String?
    
    func HTTPsendRequest(request: NSMutableURLRequest,callback: (String, String?) -> Void) {
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request,completionHandler :
            {
                data, response, error in
                if error != nil {
                    callback("", (error!.localizedDescription) as String)
                } else {
                    callback(NSString(data: data!, encoding: NSUTF8StringEncoding) as! String,nil)
                }
        })
        
        task.resume() //Tasks are called with .resume()
        
    }
    
    func httpGet(url: String, callback: (String, String?) -> Void) {
        let request = NSMutableURLRequest(URL: NSURL(string: url)!) //To get the URL of the receiver , var URL: NSURL? is used
        HTTPsendRequest(request, callback: callback)
    }
    
    override func viewDidAppear(animated: Bool) {
        httpGet("http://www.google.com") {
            (data: String, error: String?) -> Void in
            if error != nil {
                print(error)
            } else {
                let myHTMLString: String! = data
                self.webView.loadHTMLString(myHTMLString, baseURL: nil)
            }
        }
        
    }
}