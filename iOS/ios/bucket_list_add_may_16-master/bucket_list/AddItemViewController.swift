//
//  AddItemViewController.swift
//  bucket_list
//
//  Created by Andy Feng on 5/16/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    // Global Variables
    var addItemDel: AddItemDelegate?
    
    
    
    // Outlets
    @IBOutlet weak var itemTextField: UITextField!
    
    
    
    
    // Actions
    @IBAction func handleCancelButtonPressed(_ sender: UIButton) {
        // Dismiss the view
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func handleSaveButtonPressed(_ sender: UIButton) {
        print(itemTextField.text ?? "nil")
        
        addItemDel?.doneAdding(newItem: itemTextField.text!)
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
