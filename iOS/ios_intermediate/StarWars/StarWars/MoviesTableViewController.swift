//
//  MoviesTableViewController.swift
//  StarWars
//
//  Created by Ryan Holstein on 5/23/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    
    
    var movies = [String]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.getAllFilms(completionHandler: {
            data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        
                        for film in results {
                            let filmDict = film as! NSDictionary
                            self.movies.append(filmDict["title"]! as! String)
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
    




    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomTableViewCell
         cell.nameLabel.text = movies[indexPath.row]
        return cell
    }


   
}
