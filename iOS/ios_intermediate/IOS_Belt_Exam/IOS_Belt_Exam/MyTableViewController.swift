//
//  MyTableViewController.swift
//  IOS_Belt_Exam
//
//  Created by Ryan Holstein on 5/22/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit
import CoreData

class MyTableViewController: UITableViewController {

    //outlets **********************************
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let list = ["here", "is", "the"]
    
    //Load Functions ***************************
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    //Table functions **************************
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! CustomCell
       cell.titleLabel.text = list[indexPath.row]
        return cell
    }
    //Segue functions ***************************
    
    
    
    //Protocol Functions ************************
    
    
    
    

}

















// end

