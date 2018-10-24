//
//  Category.swift
//  Todoey
//
//  Created by Ernst Haeuslschmid on 22.10.18.
//  Copyright © 2018 EH iMac 27. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
