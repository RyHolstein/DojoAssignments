//
//  ViewController.swift
//  ninjaGold
//
//  Created by Ryan Holstein on 5/10/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var farmLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var casinoLabel: UILabel!
    @IBOutlet weak var caveLabel: UILabel!
    @IBOutlet var gameLabels: [UILabel]!
    
    var myScore = 0
   
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == 1 { //if farm is clicked
            clearLabels()
            let goldEarned = Int(arc4random_uniform(10)) + 10
            myScore = myScore + goldEarned
            farmLabel.isHidden = false
            farmLabel.text = "You earned \(goldEarned)"
            scoreLabel.text = "Score: \(myScore)"
        }
        else if sender.tag == 2 { //if cave  is clicked
            clearLabels()
            let goldEarned = Int(arc4random_uniform(5)) + 5
            myScore = myScore + goldEarned
            caveLabel.isHidden = false
            caveLabel.text = "You earned \(goldEarned)"
            scoreLabel.text = "Score: \(myScore)"
        }
   
        else if sender.tag == 3 { //if house is clicked
            clearLabels()
            let goldEarned = Int(arc4random_uniform(4)) + 2
            myScore = myScore + goldEarned
            houseLabel.isHidden = false
            houseLabel.text = "You earned \(goldEarned)"
            scoreLabel.text = "Score: \(myScore)"
        }
    
    
        else if sender.tag == 4 {   // if casino is clicked
            clearLabels()
            let goldEarned = Int(arc4random_uniform(100)) - 50
            myScore = myScore + goldEarned
            casinoLabel.isHidden = false
            if goldEarned >= 0 {
                casinoLabel.text = "You earned \(goldEarned)"
            }
            else {
                casinoLabel.text = "You lost \(goldEarned)"
            }
            
            scoreLabel.text = "Score: \(myScore)"
        }
    

    
    } //end of buttonPressed action
    
    
    

    @IBAction func resetPressed(_ sender: Any) {
        reset()
    }
    
    func clearLabels() {  //to clear the labels
        for game in gameLabels {
            game.isHidden = true
        }
    }
    
    func reset() {          //functio to reset everything
        clearLabels()
        myScore = 0
        scoreLabel.text = "Score: \(myScore)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }



}

