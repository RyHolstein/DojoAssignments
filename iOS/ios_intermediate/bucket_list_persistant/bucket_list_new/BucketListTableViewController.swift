//
//  BucketListTableViewController.swift
//  bucket_list_new
//
//  Created by Ryan Holstein on 5/16/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class BucketListTableViewController: UITableViewController, AddItemDelegate, EditItemDelegate {
    
    //fixture 
    var listArr = ["thing 1","thing 2","thing 3",]
    var idxCache: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //table view functions 
    
    ///how many rows are in the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArr.count
    }
    
    ///what does each cell hold
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        //set the data within the cell
        cell.textLabel?.text = listArr[indexPath.row]
        //need to return cell for fucntion
        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        //edit cell
        performSegue(withIdentifier: "addVC", sender: indexPath.row)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        listArr.remove(at: indexPath.row)
        tableView.reloadData()
    
    }
    
    //segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddItemViewController
        
        if sender is Int {
            //editing 
            if let idx = sender as? Int {
                vc.itemToEdit = listArr[idx]
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
    func doneAdding(newItem: String) {
        listArr.append(newItem)
        tableView.reloadData()
    }
    func doneEditing(editedItem: String) {
        if let i = idxCache{
            listArr[i] = editedItem
            tableView.reloadData()
            
        }
    }
    
    
    
    
    
    
    
} ///end


