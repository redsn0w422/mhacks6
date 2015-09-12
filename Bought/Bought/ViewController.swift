//
//  ViewController.swift
//  Bought
//
//  Created by Yasha Mostofi on 9/12/15.
//  Copyright (c) 2015 Yasha Mostofi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
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
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var searchURL = NSURL(string: "http://api.walmartlabs.com/v1/search?apiKey=fjhq9hxy48h97smfcrbear8u&query=ipod")
        let reposURL = NSURL(string: "http://api.walmartlabs.com/v1/paginated/items?category=3944&apiKey=fjhq9hxy48h97smfcrbear8u&format=json")
        
        if let JSONData = NSData(contentsOfURL: reposURL!)
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

