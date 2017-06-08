//
//  TableViewController.swift
//  StarWars
//
//  Created by Ryan Holstein on 5/22/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    //Variables====================================================================
    
    
    
    var people = [NSDictionary]()
    
    
    //Life Cycle Functions ========================================================

    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.getAllPeople(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
            do {
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        print(results)
                        for person in results {
                            let personDict = person as! NSDictionary
                            self.people.append(personDict)
                            
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Something went wrong")
            }
        })
            }

   
    
    
    
    
    
    
    
    
    // MARK: - Table view data source =============================================
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return people.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomTableViewCell
        cell.nameLabel.text = people[indexPath.row]["name"] as? String
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let person = people[indexPath.row]
        performSegue(withIdentifier: "peopleSegue", sender: person)
    }


    // Segue Functions  ===========================================================

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let person = sender as! NSDictionary
        let dc = sender.destination as? 
    }
    
    
    
    
    
    
    
    
    
    
    
    
}///last
































//end
