//
//  CustomTableViewCell.swift
//  BeltExam_New
//
//  Created by Ryan Holstein on 5/22/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var celldell: CustomCellDelegate?
    var idx: Int?
    
    
    private var _model: Event?
    var model: Event {
        set {
            _model = newValue
            // do some stuff
            loadModel()
        }
        get {
            return _model!
        }
    }

    func loadModel(){
        titleLabel.text = model.title
        timeLabel.text = model.time
        if model.completed == true {
            editButton.isHidden = true
        }
        else {
            editButton.isHidden = false
        }
    }
    
    @IBAction func cellEditButtonPressed(_ sender: UIButton) {
        celldell?.edit(item: idx!)
    
    
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
