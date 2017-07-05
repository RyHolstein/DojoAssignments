//
//  BucketListTableViewController.swift
//  bucket_list
//
//  Created by Andy Feng on 5/16/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import UIKit

class BucketListTableViewController: UITableViewController, AddItemDelegate {

    // Fixture
    var listArr = ["Thing 1", "Thing 2", "Thing 3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Table view functions
    
    /// How many rows are in my table?
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArr.count
    }
    
    /// What does each cell look like?
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 1. Create the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        // 2. Set some data
        cell.textLabel?.text = listArr[indexPath.row]
        
        // 3. Return the cell
        return cell
    }
    

    // Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddItemViewController
        vc.addItemDel = self
    }
    
    
    
    
    
    
    // Protocol Function
    func doneAdding(newItem: String) {
        listArr.append(newItem)
        tableView.reloadData()
    }
    
    
}

