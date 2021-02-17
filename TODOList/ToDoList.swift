//
//  ToDoList.swift
//  TODOList
//
//  Created by 이문정 on 2021/02/17.
//

import Foundation

struct TodoList {
    var title: String = ""
    var summary: String?
    var isComplete: Bool = false
    
    init(title: String, summary: String?, isComplete: Bool = false) {
        self.title = title
        self.summary = summary
        self.isComplete = isComplete
    }
}
