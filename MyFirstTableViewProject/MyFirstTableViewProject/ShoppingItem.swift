//
//  ShoppingItem.swift
//  MyFirstTableViewProject
//
//  Created by Ben Smith on 09/02/17.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit

class ShoppingItem: NSObject {

    var name: String
    var price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    func calculateSoldItems() {
        
    }
}
