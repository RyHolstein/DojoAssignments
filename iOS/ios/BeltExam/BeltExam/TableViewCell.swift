//
//  TableViewCell.swift
//  BeltExam
//
//  Created by Ryan Holstein on 5/25/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    //Outlets ========================
    
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var cellTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
