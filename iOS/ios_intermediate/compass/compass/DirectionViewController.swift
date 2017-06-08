//
//  DirectionViewController.swift
//  compass
//
//  Created by Ryan Holstein on 5/16/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class DirectionViewController: UIViewController {

    @IBOutlet weak var goBackButton: UIButton!
    var direction: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goBackButton.setTitle(direction, for: .normal)

        // Do any additional setup after loading the view.
    }
    

}
