//
//  MyViewController.swift
//  BeltExam
//
//  Created by Ryan Holstein on 5/25/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit
import CoreData

class MyViewController: UIViewController {

    //variables ===================================
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var addingDel: AddingDelegate?
    var itemToEdit: String?
    var editDel: EditingDelegate?
    //outlets ===================================

    @IBOutlet weak var textInput: UITextField!
    
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        
        
        if itemToEdit != nil {
            editDel?.editingItem(item: textInput.text!)
            dismiss(animated: true, completion: nil)
        }
        else {
            let newNote = NSEntityDescription.insertNewObject(forEntityName: "Note", into: context) as! Note
            newNote.text = textInput.text
            newNote.date_added = Date() as NSDate
            newNote.date_updated = Date() as NSDate
            addingDel?.doneAdding()
            dismiss(animated: true, completion: nil)
        }
    }
 

    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if itemToEdit != nil {
            textInput.text = itemToEdit
        }
        else{
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
