//
//  ViewController.swift
//  Bought
//
//  Created by Yasha Mostofi on 9/12/15.
//  Copyright (c) 2015 Yasha Mostofi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var repositories = [Repository]()

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return repositories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = repositories[indexPath.row].name
        cell.detailTextLabel?.text = repositories[indexPath.row].description
        println(repositories[indexPath.row].description)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let reposURL = NSURL(string: "https://api.github.com/search/repositories?q=learn+swift+language:swift&sort=stars*order=desc")
        
        if let JSONData = NSData(contentsOfURL: reposURL!)
        {
            if let json = NSJSONSerialization.JSONObjectWithData(JSONData, options: nil, error: nil) as? NSDictionary
            {
                if let reposArray = json["items"] as? [NSDictionary]
                {
                    for item in reposArray
                    {
                        repositories.append(Repository(json: item))
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

