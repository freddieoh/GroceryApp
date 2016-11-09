//
//  ViewController.swift
//  GroceryApp
//
//  Created by Fredrick Ohen on 10/20/16.
//  Copyright © 2016 GeeCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataSentDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var stores: [Store]!
    
    func userDidEnterData(store : Store) {
        
        stores.append(store)
        self.tableView.reloadData()
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textCellIdentifier = "Cell"
        
        self.stores = []
        
        let walmart = Store(name: "Walmart", number: 200)
        let krogers = Store(name: "Krogers", number: 120)
        let target = Store(name: "Target", number:1911)
        let nike = Store(name: "Nike", number: 1960)
        
        self.stores.append(walmart)
        self.stores.append(krogers)
        self.stores.append(target)
        self.stores.append(nike)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"TextCell") as UITableViewCell!
        
        let store = self.stores[indexPath.row]
        
        cell?.textLabel?.text = store.name
        cell?.detailTextLabel?.text = "\(store.number!)"
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showSendingVC" {
            let addStoreViewController: AddStoreViewController = segue.destination as! AddStoreViewController
            addStoreViewController.delegate = self
        } else if segue.identifier == "ItemSegue" {
            // for items segue
            let indexPath = tableView.indexPathForSelectedRow
            
            let selectedRowIndex = (indexPath?.row)!
            let selectedStore = stores[selectedRowIndex]
            
            let storeItemTVC = segue.destination as! StoreItemTableViewController
            storeItemTVC.selectedStore = selectedStore
            
        }
        
    }
}

