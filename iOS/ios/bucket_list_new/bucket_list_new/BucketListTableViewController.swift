//
//  BucketListTableViewController.swift
//  bucket_list_new
//
//  Created by Ryan Holstein on 5/16/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit
import CoreData

class BucketListTableViewController: UITableViewController, AddItemDelegate, EditItemDelegate {
    
    //fixture 
    var listArr = [Item]()
    var idxCache: Int?
    let section = ["Incomplete", "Complete"]
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
///view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchStuff()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //table view functions 
    

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
        return section.count
        
    }
    
    //***********how many rows are in the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArr.count
    }
    
    //***********what does each cell hold
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        //set the data within the cell
       
        
        cell.textLabel?.text = listArr[indexPath.row].title
        //need to return cell for fucntion
        
        
        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        //edit cell
        performSegue(withIdentifier: "addVC", sender: indexPath.row)
        
    }
    

//delete function
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        context.delete(listArr[indexPath.row])
        if context.hasChanges {
            do {
                try context.save()
                print("Success")
                fetchStuff()
            } catch {
                print("\(error)")
            }
        }
    }
   
    
    
    //fetch all the items from core data
    
    func fetchStuff(){
        print("fetching")
        
        let itemRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        do {
            // get the results by executing the fetch request we made earlier
            let results = try context.fetch(itemRequest)
            
            listArr = results as! [Item]
        
            tableView.reloadData()
        }
        catch {
            // print the error if it is caught (Swift automatically saves the error in "error")
            print("\(error)")
        }

    }
        
        
        
        
    //segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddItemViewController
        
        if sender is Int {
            //editing
            if let idx = sender as? Int {
                vc.itemToEdit = listArr[idx].title
                idxCache = idx 
            }
            vc.editItemDel = self 
        }
        else {
            //adding
        }
        
        vc.addItemDel = self
    }
    
    
    //Protocall Functions 
    func doneAdding() {
 //       listArr.append(newItem)
        fetchStuff()
        tableView.reloadData()
    }
    func doneEditing(editedItem: String) {
   
        
        if let i = idxCache {
            listArr[i].title = editedItem
        }
        if context.hasChanges {
            do {
                try context.save()
                print("Success")
                fetchStuff()
            } catch {
                print("\(error)")
            }
        }


        
    }
    
    
    
    
    
    
    
}///end


