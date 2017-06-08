//
//  AddItemViewController.swift
//  bucket_list_new
//
//  Created by Ryan Holstein on 5/16/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    //outlets 
    
    @IBOutlet weak var itemTextField: UITextField!
    var addItemDel: AddItemDelegate? 
    var itemToEdit: String?
    var editItemDel: EditItemDelegate?
    
    
    //actions
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    
    }
    //save whats in the text field
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        if (itemToEdit != nil) {
            //edit
            editItemDel?.doneEditing(editedItem: itemTextField.text!)
        }
        else {
            //adding
            addItemDel?.doneAdding(newItem: itemTextField.text!)
            
        }
        
        dismiss(animated: true, completion: nil)
        
        
        
        
    
    
    
    
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //check to see if adding or editing 
        if let item = itemToEdit {
            //editing
            itemTextField.text = item
        }
        else{
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
