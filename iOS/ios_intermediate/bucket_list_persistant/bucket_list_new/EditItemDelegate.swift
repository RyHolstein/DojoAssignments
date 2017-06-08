//
//  EditItemDelegate.swift
//  bucket_list_new
//
//  Created by Ryan Holstein on 5/16/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import Foundation

protocol EditItemDelegate: class {
    func doneEditing(editedItem: String)
}
