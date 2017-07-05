//
//  TableViewController.swift
//  todoList
//
//  Created by Ryan Holstein on 5/18/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var list = [ListItem]()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateList()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    
    
/// ******* Section for Cells *******

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
        
    }



    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CustomCellNew
        
        
        cell.cellTitle?.text = list[indexPath.row].title
        cell.cellTask?.text = list[indexPath.row].taskInfo
        //cell.cellDate?.text = list[indexPath.row].date
        

        return cell
    }







    func updateList(){
        print("updating List")
        let itemRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ListItem")
        do {
            // get the results by executing the fetch request we made earlier
            let results = try context.fetch(itemRequest)
            
            list = results as! [ListItem]
            tableView.reloadData()
            
        } catch {
            print("\(error)")
        }
    }
    













}
///end
