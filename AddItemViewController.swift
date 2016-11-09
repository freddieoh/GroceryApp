//
//  AddItemViewController.swift
//  GroceryApp
//
//  Created by Fredrick Ohen on 10/25/16.
//  Copyright © 2016 GeeCode. All rights reserved.
//

import UIKit

protocol ItemSentDelegate {
    func userDidEnterItemData(data:StoreItem)
    
}

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var itemEntryTextField: UITextField!
    var delegate:ItemSentDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

@IBAction func itemSavedButtonPressed(_ sender: UIButton) {
    if delegate != nil {
    if itemEntryTextField.text != nil {
    let data = itemEntryTextField.text
        let myItem = StoreItem()
        myItem.name = data!
        delegate?.userDidEnterItemData(data: myItem)
        self.dismiss(animated: true, completion:nil)
            }
        }
    }

}
