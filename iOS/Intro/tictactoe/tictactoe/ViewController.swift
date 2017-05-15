//
//  ViewController.swift
//  tictactoe
//
//  Created by Ryan Holstein on 5/10/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var ttButton: [UIButton]!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    var blueScore = [0,0,0,0,0,0,0,0]
    var redScore = [0,0,0,0,0,0,0,0]

    
    var turn = 0
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.backgroundColor == UIColor.red || sender.backgroundColor == UIColor.blue{
            return
        }
        if winnerLabel.text == "Red Wins" || winnerLabel.text == "Blue Wins" {
            return
        }
            
        else {
            if turn % 2 == 0 {
                sender.backgroundColor = UIColor.red
                turn = turn + 1
                /// add to scores array for red team
                // check horizontal
                if sender.tag == 1 || sender.tag == 2 || sender.tag == 3 {
                    redScore[0] = redScore[0] +  1
                }
                if sender.tag == 4 || sender.tag == 5 || sender.tag == 6 {
                    redScore[1] = redScore[1] +  1
                }
                if sender.tag == 7 || sender.tag == 8 || sender.tag == 9 {
                    redScore[2] = redScore[2] +  1
                }
                //check vertical
                if sender.tag == 1 || sender.tag == 4 || sender.tag == 7 {
                    redScore[3] = redScore[3] +  1
                }
                if sender.tag == 2 || sender.tag == 5 || sender.tag == 8 {
                    redScore[4] = redScore[4] +  1
                }
                if sender.tag == 3 || sender.tag == 6 || sender.tag == 9 {
                    redScore[5] = redScore[5] +  1
                }
                //check Diagonal 
                if sender.tag == 1 || sender.tag == 5 || sender.tag == 9 {
                    redScore[6] = redScore[6] +  1
                }
                if sender.tag == 3 || sender.tag == 5 || sender.tag == 7 {
                    redScore[7] = redScore[7] +  1
                }
                
            }
            else {
                sender.backgroundColor = UIColor.blue
                turn = turn + 1
                // check horizontal
                if sender.tag == 1 || sender.tag == 2 || sender.tag == 3 {
                    blueScore[0] = blueScore[0] +  1
                }
                if sender.tag == 4 || sender.tag == 5 || sender.tag == 6 {
                    blueScore[1] = blueScore[1] +  1
                }
                if sender.tag == 7 || sender.tag == 8 || sender.tag == 9 {
                    blueScore[2] = blueScore[2] +  1
                }
                //check vertical
                if sender.tag == 1 || sender.tag == 4 || sender.tag == 7 {
                    blueScore[3] = blueScore[3] +  1
                }
                if sender.tag == 2 || sender.tag == 5 || sender.tag == 8 {
                    blueScore[4] = blueScore[4] +  1
                }
                if sender.tag == 3 || sender.tag == 6 || sender.tag == 9 {
                    blueScore[5] = blueScore[5] +  1
                }
                //check Diagonal
                if sender.tag == 1 || sender.tag == 5 || sender.tag == 9 {
                    blueScore[6] = blueScore[6] +  1
                }
                if sender.tag == 3 || sender.tag == 5 || sender.tag == 7 {
                    blueScore[7] = blueScore[7] +  1
                }

            }
        }
        
        checkWinner()
    }
    
    
    
    
    
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        reset()
    }
    
    
///Check for Winner


    func checkWinner(){
        if turn <= 9 {
            for blue in blueScore {
                if blue == 3{
                    winnerLabel.text = "Blue Wins"
                    winnerLabel.textColor = UIColor.blue
                    winnerLabel.isHidden = false
                    return
                }
            }
            for red in redScore {
                if red == 3 {
                    winnerLabel.text = "Red Wins"
                    winnerLabel.textColor = UIColor.red
                    winnerLabel.isHidden = false
                    return
                }
            }
            if turn == 9 {
                winnerLabel.text = "Tie game"
                winnerLabel.isHidden = false
            }
            
        }
    }
    
    
    func reset() {
        for button in ttButton {
            button.backgroundColor = UIColor.lightGray
        }
        turn = 0
        blueScore = [0,0,0,0,0,0,0,0]
        redScore = [0,0,0,0,0,0,0,0]
        winnerLabel.textColor = UIColor.black
        winnerLabel.isHidden = true
        winnerLabel.text = ""
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }


}

