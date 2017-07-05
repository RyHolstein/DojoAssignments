//
//  MyTableViewController.swift
//  BeltExam_New
//
//  Created by Ryan Holstein on 5/22/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit
import CoreData

class MyTableViewController: UITableViewController, DoneAddingTaskDelegate, CustomCellDelegate, DoneEditingDelegate {
    
    
    //variables **********************
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var events = [Event]()
    let options = ["Incomplete", "Complete"]
    var idxcache: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    //table views ******************
 
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Incomplete"
        }
        else {
            return "Complete"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomTableViewCell
        cell.model = events[indexPath.row]
        cell.celldell = self
        cell.idx = indexPath.row
        
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if events[indexPath.row].completed == true {
            events[indexPath.row].completed = false
            print(events[indexPath.row].completed)
            fetchData()
        }
        else {
            events[indexPath.row].completed = true
            print(events[indexPath.row].completed)
            fetchData()
        }
       // if indexPath.section == 0 {
       //     let newIndexPath = [NSIndexPath indexPathForRow: indexPath.row, section: indexPath.section + 1]
       //     indexPath = newIndexPath
       // }
    //I dont know how to change sections
        
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //too swipe to delete 
        context.delete(events[indexPath.row])
        if context.hasChanges {
            do {
                try context.save()
                fetchData()
            } catch {
                print("\(error)")
            }
        }
    }

    //core data fucntions
    func fetchData(){
        let itemRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Event")
        
        do {
            let results = try context.fetch(itemRequest)
            
            
            
            
                events = results as! [Event]
            tableView.reloadData()
        } catch {
            print("\(error)")
        }
        
        if context.hasChanges {
            do {
                try context.save()
                fetchData()
            } catch {
                print("\(error)")
            }
        }

    }
    
    
   
    //segue functions 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddViewController
        vc.doneAddingDel = self
        vc.editDoneDel = self
        if sender is Int {
            if let idx = sender as? Int {
                vc.titleEdit = events[idx].title
                vc.infoEdit = events[idx].info
                vc.timeEdit = events[idx].time
                idxcache = idx
            }
        }
        
        
    }

    
    
    
    //protocol functions ****************
    func doneAdding() {
        self.navigationController?.popViewController(animated: true)
        fetchData()
    }

    func edit(item: Int) {
        performSegue(withIdentifier: "Segue", sender: item)
        print(item)
    }




    func doneEditing(title: String, info: String, Date: String) {
        if let i = idxcache {
            events[i].title = title
            events[i].info = info
            events[i].time = Date
            fetchData()
            self.navigationController?.popViewController(animated: true)
        }
        
    }



}






//end
