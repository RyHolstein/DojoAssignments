//
//  AddItemDelegate.swift
//  bucket_list
//
//  Created by Andy Feng on 5/16/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import Foundation

protocol AddItemDelegate: class {
    func doneAdding(newItem: String)
}
