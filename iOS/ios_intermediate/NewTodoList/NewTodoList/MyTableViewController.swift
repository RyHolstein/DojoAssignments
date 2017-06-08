//
//  MyTableViewController.swift
//  NewTodoList
//
//  Created by Ryan Holstein on 5/21/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

   
    let list = ["this is 1", "this is 2", "this is 3", "this is 4"]

    // MARK: *********Table Functions*********
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! CustomCell
        cell.cellText.text = list[indexPath.row]
        return cell
        }
    
    
    
    
    
    
    //*********life cycle functions*********

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
}

