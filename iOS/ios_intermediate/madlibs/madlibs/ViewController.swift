//
//  ViewController.swift
//  madlibs
//
//  Created by Ryan Holstein on 5/17/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var madLibLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        madLibLabel.text = "..."
    }

    @IBAction func returntoMenu(segue: UIStoryboardSegue) {
        let controller = segue.source as! MadLibViewController
        let adj = controller.adjTextField.text!
        let verb1 = controller.verbTextField.text!
        let verb2 = controller.verb2TextField.text!
        let noun1 = controller.noutTextField.text!
        
        let madLib = "We are Having a perfectly \(adj) time now. later we will \(verb1) and \(verb2) in the \(noun1)."
        
        
        
        madLibLabel.text = madLib
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

