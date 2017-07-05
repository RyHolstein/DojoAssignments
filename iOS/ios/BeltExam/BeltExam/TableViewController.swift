//
//  TableViewController.swift
//  BeltExam
//
//  Created by Ryan Holstein on 5/25/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController, AddingDelegate, EditingDelegate, UISearchBarDelegate {

    //Variables=================================
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var idxCache: Int?
    var notes = [Note]()
    var filteredNotes = [Note]()
    @IBOutlet weak var searchBar: UISearchBar!
    var isSearching = false
    
   
    



    
    
    // life cycle functions ========================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        
        fetchData()
        
    }
        
        
        
    

    //Core Data functions ===============================
    
    func fetchData(){
        let itemRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        
        let sortDescriptor = NSSortDescriptor(key: "date_updated", ascending: false)
        itemRequest.sortDescriptors = [sortDescriptor]

        do {
            let results = try context.fetch(itemRequest)
            notes = results as! [Note]
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


    // MARK: - Table view data source====================

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredNotes.count
        }
        
        
        return notes.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        
        
        if isSearching {
            cell.cellTextLabel.text = filteredNotes[indexPath.row].text
            
            
        } else {
            cell.cellTextLabel.text = notes[indexPath.row].text
            //format the date
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy"
            let myDate = notes[indexPath.row].date_added
            let myString = formatter.string(from: myDate! as Date)
            cell.dateLabel.text = myString
        }
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Segue", sender: indexPath.row)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //too swipe to delete
        context.delete(notes[indexPath.row])
        if context.hasChanges {
            do {
                try context.save()
                fetchData()
            } catch {
                print("\(error)")
            }
        }
    }
    
    
    
    //segues ===============================
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MyViewController
        vc.addingDel = self
        if sender is Int {
            if let idx = sender as? Int {
                vc.itemToEdit = notes[idx].text
                idxCache = idx
            }
        vc.editDel = self
        }
    }
    
    
    //delegateFunctions
    func doneAdding(){
        fetchData()
    }
    func editingItem(item: String) {
        if let i = idxCache {
            notes[i].text = item
            notes[i].date_updated = Date() as NSDate
        }
        fetchData()
    }
    
    //search bar 
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            isSearching = true
            filteredNotes = notes.filter { fnote in
                return fnote.text!.contains(searchText)}
            tableView.reloadData()
        }
    }
    
    
    
} //end


