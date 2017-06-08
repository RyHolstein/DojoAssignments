//
//  addItemTableViewController.swift
//  bucket_list
//
//  Created by Ryan Holstein on 5/16/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class addItemTableViewController: UITableViewController {
    
    
    weak var delegate: AddItemTableViewControllerDelegate?
    var item: String?
    var indexPath: NSIndexPath?
    
    @IBAction func cancelbuttonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelbuttonPressed(by: self)
    }
   
    @IBAction func savedButtonPressed(_ sender: UIBarButtonItem) {
        let text = itemTextField.text!
        delegate?.itemSaved(by: self, with: text, at: indexPath)
    }
    
    
    @IBOutlet weak var itemTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTextField.text = item

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
