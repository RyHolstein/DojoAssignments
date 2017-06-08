//
//  ViewController.swift
//  compass
//
//  Created by Ryan Holstein on 5/16/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBAction func directionButtonPressed(_ sender: UIButton) {
        //when the direction button is pressed
        performSegue(withIdentifier: "directionSegue", sender: sender.titleLabel!.text!)
    }
    

    //segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let direction = sender as! String
        let controller = segue.destination as! DirectionViewController
        controller.direction = direction 
    }
    
    
    @IBAction func goHome(segue: UIStoryboardSegue) {
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

