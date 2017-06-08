//
//  AddItemTableViewControllerDelegate.swift
//  bucket_list
//
//  Created by Ryan Holstein on 5/16/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import Foundation

protocol AddItemTableViewControllerDelegate: class {
    func itemSaved(by controller: addItemTableViewController, with text: String, at indexPath: NSIndexPath?)
    func cancelbuttonPressed(by controller: addItemTableViewController)
}
