//
//  CustomTableViewCell.swift
//  StarWars
//
//  Created by Ryan Holstein on 5/22/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    //outlets ----------------------------
   
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
