//
//  ViewController.swift
//  tip_calculator
//
//  Created by Ryan Holstein on 5/11/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calcLabel: UILabel!
    @IBOutlet weak var groupsizeLabel: UILabel!
    @IBOutlet weak var groupSize: UISlider!
    //columns for totals
    @IBOutlet weak var column1Total: UILabel!
    @IBOutlet weak var column2Total: UILabel!
    @IBOutlet weak var column3Total: UILabel!
    // percentage columns
    @IBOutlet weak var percentMin: UILabel!
    @IBOutlet weak var percentMid: UILabel!
    @IBOutlet weak var percentMax: UILabel!
    // tip ammount columns
    @IBOutlet weak var tipMin: UILabel!
    @IBOutlet weak var tipMid: UILabel!
    @IBOutlet weak var tipMax: UILabel!
    
    
    
    
    var calcNumber = "0"
    var tipValue = 10
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if sender.tag >= 0 && calcNumber == "0"{
            calcNumber = String(sender.tag)
            update()
        }
        else if sender.tag >= 0 {
            calcNumber = calcNumber + String(sender.tag)
            update()
        }
        
        else if sender.tag == -2{
            calcNumber = calcNumber + "."
            update()
        }
        else if sender.tag == -1 {
            reset()
        }
    }
    
    
    func update() { // update all the tables
        calcLabel.text = calcNumber
        groupsizeLabel.text = String(Int(groupSize.value))
        let amount = Double(calcNumber)
        
        //percent Labels
        let minTip = Double(tipValue)/100
        let midTip = Double(tipValue + 5)/100
        let maxTip = Double(tipValue + 10)/100
        
        percentMin.text = String(Int(minTip * 100)) + "%"
        percentMid.text = String(Int(midTip * 100)) + "%"
        percentMax.text = String(Int(maxTip * 100)) + "%"
        
        //tip caculations
        let tipamoutMin = amount! * minTip
        let tipamountMid = amount! * midTip
        let tipamountMax = amount! * maxTip
        
        tipMin.text = String(tipamoutMin)
        tipMid.text = String(tipamountMid)
        tipMax.text = String(tipamountMax)
        
        //total calculations
        let tipSize1 = (Double(calcNumber)! + tipamoutMin)/Double(Int(groupSize.value))
        let tipSize2 = (Double(calcNumber)! + tipamountMid)/Double(Int(groupSize.value))
        let tipSize3 = (Double(calcNumber)! + tipamountMax)/Double(Int(groupSize.value))
        
        
        //total Lables
        column1Total.text = String(format: "%.2f", tipSize1)
        column2Total.text = String(format: "%.2f", tipSize2)
        column3Total.text = String(format: "%.2f", tipSize3)
        
    }
    
    func reset() { //clear the calc
        calcNumber = "0"
        update()
    }
    
    
    @IBAction func tipsliderChanged(_ sender: UISlider) {
        tipValue = Int(sender.value)
        update()
    }
    
    @IBAction func groupsizeSlider(_ sender: Any) {
        update()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        
        // Do any additional setup after loading the view, typically from a nib.
    }


    

    

}

