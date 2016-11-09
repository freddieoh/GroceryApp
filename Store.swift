//
//  Store.swift
//  GroceryApp
//
//  Created by Fredrick Ohen on 10/26/16.
//  Copyright © 2016 GeeCode. All rights reserved.
//

import Foundation

class Store {
   
    var name: String!
    var number: Int!
    var storeItems: [StoreItem] = []
    
    init() {}
    init(name: String, number: Int, storeItems: [StoreItem] = []) {
        self.name = name
        self.number = number
        self.storeItems = storeItems
    }
}
