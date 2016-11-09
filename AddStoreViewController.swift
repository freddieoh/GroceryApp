//
//  AddStoreViewController.swift
//  GroceryApp
//
//  Created by Fredrick Ohen on 10/23/16.
//  Copyright © 2016 GeeCode. All rights reserved.
//

import UIKit

// put in own file
protocol DataSentDelegate: class {
    func userDidEnterData(store:Store)
}


class AddStoreViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var dataEntryTextField: UITextField?
    @IBOutlet weak var numberEntryTextField: UITextField?
    
    // Variables
    var delegate: DataSentDelegate? = nil
    
    @IBAction func savedButtonPressed(_ sender: UIButton) {

        guard let data = dataEntryTextField?.text,
            let number = Int((numberEntryTextField?.text)!),
            delegate != nil else {
            return
        }
        let newStore = Store(name: data, number: number, storeItems: [])
        
        delegate?.userDidEnterData(store: newStore)
        dismiss(animated: true, completion: {})
    }
}
