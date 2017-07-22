//
//  ListOfToDo.swift
//  ToDoTask
//
//  Created by YERZHAN SERIKBAY on 6/16/17.
//  Copyright © 2017 YERZHAN SERIKBAY. All rights reserved.
//

import UIKit

enum Groups {
    case Undefined
    case Shop
    case Reminder
    case Spends
    case Work
}

class ListOfToDo {
    var title: String?
    var group: Groups = .Undefined
    var date: String
    
    init(title: String?, group: Groups, date: String) {
        self.title = title
        self.group = group
        self.date = date
    }
    
    static func fetchList() -> [ListOfToDo] {
        return []
    }
}
