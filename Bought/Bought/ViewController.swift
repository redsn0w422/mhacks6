//
//  ViewController.swift
//  Bought
//
//  Created by Yasha Mostofi on 9/12/15.
//  Copyright (c) 2015 Yasha Mostofi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var repositories = [String]()

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return repositories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = repositories[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

