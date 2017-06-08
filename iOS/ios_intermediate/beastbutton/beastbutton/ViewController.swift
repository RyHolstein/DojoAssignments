//
//  ViewController.swift
//  beastbutton
//
//  Created by Ryan Holstein on 5/15/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textInputField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var tasks = ["Exercise for 30 minutes", "Wireframe for some project", "Do laundry"]
    
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        tasks.append(textInputField.text!)
        tableView.reloadData()
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }







}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    

}
