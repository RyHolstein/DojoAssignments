//
//  ViewController.swift
//  aging_people
//
//  Created by Ryan Holstein on 5/15/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let myPeople = ["Jhon", "Json", "Timy", "Eman", "Sig", "Boba", "Mike", "Conway", "Kelly", "Dick", "Obi", "Anakin"]
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

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = myPeople[indexPath.row]
        let randAge = arc4random_uniform(90) + 5
        cell.detailTextLabel?.text = "\(randAge) Years Old"
        return cell
    }
}
