//
//  ViewController.swift
//  Bought
//
//  Created by Yasha Mostofi on 9/12/15.
//  Copyright (c) 2015 Yasha Mostofi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UITextField!
    var products = [Products]()

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = products[indexPath.row].name
        cell.detailTextLabel?.text = products[indexPath.row].description
        
        if let url = NSURL(string: products[indexPath.row].img_url!)
        {
            if let data = NSData(contentsOfURL: url)
            {
//                imageURL.contentMode = UIViewContentMode.ScaleAspectFit
                
                cell.imageView!.image = UIImage(data: data)
            }
        }
        
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        queryData("ipod")
    }
    
    
    @IBAction func Search(sender: AnyObject)
    {
        queryData(searchBar.text)
    }
    
    

    
    func queryData(search: String)
    {
        
       
//        self.performSegueWithIdentifier("showWebView", sender: self)
        
//        let myHTMLString:String! = "<h1>Hello Pizza!</h1>"
//        webView.loadHTMLString(myHTMLString, baseURL: nil)
        
        
        products = [Products]()
        
        let searchURL = NSURL(string: "http://api.walmartlabs.com/v1/search?apiKey=fjhq9hxy48h97smfcrbear8u&format=json&query=" + search)
//        println(searchURL)
        let reposURL = NSURL(string: "http://api.walmartlabs.com/v1/paginated/items?category=3944&apiKey=fjhq9hxy48h97smfcrbear8u&format=json")
        
        if let JSONData = NSData(contentsOfURL: searchURL!)
        {
            if let json = NSJSONSerialization.JSONObjectWithData(JSONData, options: nil, error: nil) as? NSDictionary
            {
                if let prodArray = json["items"] as? [NSDictionary]
                {
                    for item in prodArray
                    {
                        products.append(Products(json: item))
                    }
                }
            }
        }
        tableView.reloadData()
    }
    
//    func textFieldShouldReturn(searchBar: UITextField!) -> Bool {
//        searchBar.resignFirstResponder()
//        println("test")
//        return true
//    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        println("clicked")
        self.performSegueWithIdentifier("showWebView", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

