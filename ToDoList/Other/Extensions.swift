//
//  Extensions.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import Foundation

// Encodable is the part of codable protocol (being used in the User model) which is responsible for encoding it into data
extension Encodable {
    func asDictionary() -> [String: Any] { // returns a dictionary of String and Any
        guard let data = try? JSONEncoder().encode(self) else { // data is the data from the current thing that is encodable. We are trying to encode self. We use try optional to encode the current (self) and if we fail the Guard will return an empty dictionary.
            return [:]
        }
         // We have data, so doing a try:catch
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] // give me a json with this data. Cast this as a [String:Any] dictionary
            return json ?? [:] // return json otherwise an empty dictionary
        } catch {
            return [:] // if we catch an error, we will return an empty dictionary
        }
    }
}
