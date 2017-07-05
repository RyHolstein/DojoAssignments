//
//  AddViewController.swift
//  BeltExam_New
//
//  Created by Ryan Holstein on 5/22/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    //outlets *******
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var infoLabel: UITextView!
    @IBOutlet weak var dateLabel: UIDatePicker!
    var doneAddingDel: DoneAddingTaskDelegate?
    var editDoneDel: DoneEditingDelegate?
    
    //items needed to be edited ******
    var titleEdit: String?
    var infoEdit: String?
    var timeEdit: String?
    
    
    
   
    @IBOutlet weak var saveButtonPressed: UIButton!
    @IBAction func saveButtonPressed(_ sender: UIButton) {
    
        
        if (titleEdit != nil) {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            let myString = formatter.string(from: dateLabel.date as Date)
            editDoneDel?.doneEditing(title: titleLabel.text! , info: infoLabel.text!, Date: myString)
        }
        else {
            let newTask = NSEntityDescription.insertNewObject(forEntityName: "Event", into: context) as! Event
            newTask.title = titleLabel.text
            newTask.info = infoLabel.text
            
            //format the date
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            let myString = formatter.string(from: dateLabel.date as Date)
            newTask.time = myString
            newTask.completed = false
            print("Task Added")
            
            
            doneAddingDel?.doneAdding()
        
            
        }
        
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = titleEdit {
            //editing
            titleLabel.text = item
            infoLabel.text = infoEdit
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let date = dateFormatter.date(from: timeEdit!)
            dateLabel.date = date!
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
