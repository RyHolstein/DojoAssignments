//
//  ViewController.swift
//  ToDoList
//
//  Created by Ryan Holstein on 5/18/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    //***********Outlets***********
    @IBOutlet weak var tableData: UITableView!
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var list = [Item]()
    
    
    //***********OnViewLoad***********
    override func viewDidLoad() {
        super.viewDidLoad()
        tableData.dataSource = self
        fetch()
    }

    
    //***********CoreData***********
    func fetch(){
        print("Fetching....")
        let userRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        do {
            let results = try managedObjectContext.fetch(userRequest)
            self.list = results as! [Item]
        
        } catch {
            print("\(error)")
        }
    
    }
    
    
    func saveManagedObject(){
        do {
            try managedObjectContext.save()
        } catch {
            print(error)
        }
    
    }

    
    
    
    //***********segues***********
    @IBAction func goHome(_ segue: UIStoryboardSegue){
        let controller = segue.source as! AddViewController
        
        //create a new entry for CoreData
        let newItem = NSEntityDescription.insertNewObject(forEntityName: "Item", into: managedObjectContext) as! Item
        
        //set items for new entry 
        newItem.title = controller.titleInputField.text!
        newItem.detail = controller.taskInputField.text!
        newItem.date = controller.datePicker.date as NSDate
        newItem.completed = false
        
        //save the context
        saveManagedObject()
        
        //reload
        fetch()
        tableData.reloadData()
    }
}

///******************Extenstion for the Table Data******************
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let item = list[indexPath.row]
        cell.taskName.text = item.title
        cell.taskInfo.text = item.detail
       
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from: item.date! as Date)
        cell.taskDate.text = dateString
        
        if item.completed {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let todoItem = self.list[indexPath.row]
        todoItem.completed = !todoItem.completed
        saveManagedObject()
        
        let cell = tableView.cellForRow(at: indexPath)
        if todoItem.completed {
            cell?.accessoryType = .checkmark
        } else {
            cell?.accessoryType = .none
        }
        
    }
    
}

































//end

