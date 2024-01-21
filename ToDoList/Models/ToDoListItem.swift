//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import Foundation

// Codable because we will use encodable to make the dictionaries and identifiable because we are delcaring each item will have a unique identifier.
struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createDueDate: TimeInterval
    var isDone: Bool
    
    // Swift won't let us write methods that change properties unless we specifically request it. Since we are changing isDone here, we need a mutating function
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
