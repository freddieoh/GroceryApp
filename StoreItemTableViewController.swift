//
//  StoreItemTableViewController.swift
//  GroceryApp
//
//  Created by Fredrick Ohen on 10/24/16.
//  Copyright © 2016 GeeCode. All rights reserved.
//

import UIKit

class StoreItemTableViewController: UITableViewController,ItemSentDelegate  {

    @IBOutlet weak var itemsTableViewController: UITableView!
    var selectedStore :Store!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = selectedStore.name
        

    }
    func userDidEnterItemData(data:StoreItem) {
      
        selectedStore.storeItems.append(data)
        self.tableView.reloadData()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItemSegue" {
            let addItemVC: AddItemViewController = segue.destination as! AddItemViewController
            addItemVC.delegate = self
        }
           }
    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return selectedStore.storeItems.count
    
    }
 
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        //selectedStore.storeItems = []
        //let storeItems = selectedStore.storeItems
        //var myItem = storeItems[indexPath.row]
        cell.textLabel?.text = selectedStore.storeItems[indexPath.row].name
        
        return cell
    }

}
