//
//  ViewController.swift
//  coldcall
//
//  Created by Ur Moms Anus on 5/10/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameHeader: UILabel!
    @IBOutlet weak var numberLogo: UILabel!
    
    
    let nameList = ["Saitama", "Vegita", "Monkey D. Luffy", "Ichigo", "Kakashi"]
    
    func randomName(){
        let rand = Int(arc4random_uniform(5))
        let randNumber = (arc4random_uniform(5) + 1)
        nameHeader.text = nameList[rand]
        numberLogo.text = String(randNumber)
       
        if randNumber == 5 {
            numberLogo.textColor = UIColor.green
        }
        else if randNumber > 2 {
            numberLogo.textColor = UIColor.orange
        }
        else if randNumber >= 0 {
            numberLogo.textColor = UIColor.red
        }
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        numberLogo.isHidden = false
        randomName()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomName()
        numberLogo.isHidden = true
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

