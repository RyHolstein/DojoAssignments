//
//  CustomCellViewController.swift
//  binarycounter
//
//  Created by Ryan Holstein on 5/17/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class CustomCellViewController: UIViewController, addDelegate {
    
    var powers = ["1"]
    var totalNumber = 0
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    
//when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        findPowers()
        totalLabel.text = "total: \(totalNumber)"
        tableView.dataSource = self
    }
    
//get all of the numbers in the array
    func findPowers(){
        for x in 1...20{
            let powerNum = pow(10, x)
            powers.append(String(describing: powerNum))
    
        }
    }
  
    
    
    
//******************Functions for delegate******************
    
    func addNum(num: Int) {
        //add theNumber Given to the total 
        print("running function")
        totalNumber = totalNumber + num
        totalLabel.text = "total: \(totalNumber)"
    }

}


///*************************extenstion for Table Data *************************
extension CustomCellViewController: UITableViewDataSource {
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.customCellLabel.text = "\(powers[indexPath.row])"
        cell.addDel = self
        return cell
    }
    
    
    
    
    //number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    
}






//end
