//
//  ViewController.swift
//  bucket_list
//
//  Created by Ryan Holstein on 5/16/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class bucketListViewController: UITableViewController, AddItemTableViewControllerDelegate {
    
    var items = ["go to moon", "find love", "make a happy home", "destroy humanity"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listItem", for: indexPath)
       
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "AddItemSegue" {
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! addItemTableViewController
            addItemTableViewController.delegate = self
        }
        else if segue.identifier == "EditItemSegue"{
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! addItemTableViewController
            addItemTableViewController.delegate = self
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            addItemTableViewController.item = item
            addItemTableViewController.indexPath = indexPath

        }
    }

    
    
    
    func cancelbuttonPressed(by controller: addItemTableViewController) {
        dismiss(animated: true, completion: nil)
    }
    func itemSaved(by controller: addItemTableViewController, with text: String, at indexPath: NSIndexPath?) {

        
        if let ip = indexPath {
            items[ip.row] = text
        }
        else {
            items.append(text)

        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
} // the end



























//end
