//
//  ViewController.swift
//  todoList
//
//  Created by Ryan Holstein on 5/18/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    //**********Outlets**********
    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var detailInput: UITextField!
    @IBOutlet weak var dateInput: UIDatePicker!
    
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    
    //**********ButtonsPressed**********
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if titleInput.text! == "" || detailInput.text! == ""{
             print("error")
        }
        else {
            let newitem = NSEntityDescription.insertNewObject(forEntityName: "ListItem", into: context) as! ListItem
            
            
            print(titleInput.text!)
            
            newitem.title = titleInput.text!
            newitem.taskInfo = detailInput.text!
            newitem.date = dateInput.date as NSDate
            print("successfully added")
            dismiss(animated: true, completion: nil)
        }
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
