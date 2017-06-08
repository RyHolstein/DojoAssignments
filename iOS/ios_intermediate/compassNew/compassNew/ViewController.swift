//
//  ViewController.swift
//  compassNew
//
//  Created by Ryan Holstein on 5/16/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //when button is pressed
    @IBAction func directionPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "directionSegue", sender: sender.titleLabel!.text!)
    }
    
    
    //prepare for seague 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let direction = sender as! String
        let controller = segue.destination as! DirectionViewController
        controller.direction = direction
    }
    
    
    
    
    //segueback to main page 
    @IBAction func goHome(_ segue: UIStoryboardSegue){
    
    
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

