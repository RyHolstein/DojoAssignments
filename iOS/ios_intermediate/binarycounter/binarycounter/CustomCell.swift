//
//  CustomCell.swift
//  binarycounter
//
//  Created by Ryan Holstein on 5/17/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import Foundation
import UIKit
class CustomCell: UITableViewCell {
    
    
    var addDel: addDelegate?
    @IBOutlet weak var customCellLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.titleLabel!.text! == "+"{

            let theNumber = Int(self.customCellLabel.text!)
    
            addDel?.addNum(num: theNumber!)
            print("Finished +")
        }
        else if sender.titleLabel!.text! == "-" {

            let theNumber = Int(self.customCellLabel.text!)
            addDel?.addNum(num: -theNumber!)
            print("Finished -")
        }
    }
    
    
    
    
    
    
}//end
