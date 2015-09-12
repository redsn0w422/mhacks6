//
//  Repository.swift
//  Bought
//
//  Created by Yasha Mostofi on 9/12/15.
//  Copyright (c) 2015 Yasha Mostofi. All rights reserved.
//

import Foundation
import UIKit

class Products
{
    var name: String?
    var description: String?
    var html_url: String?
    
    init(json: NSDictionary)
    {
        self.name = json["name"] as? String
        self.description = json["salePrice"] as? String
        self.html_url = json["productUrl"] as? String
    }
}