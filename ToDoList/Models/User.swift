//
//  User.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import Foundation

// Use Codable so any of the data that is codable can use an extension (encodable) to turn this data into a nice dictionary.
struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
