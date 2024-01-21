//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import Foundation
import Observation
import FirebaseAuth
import FirebaseFirestore

@Observable
class NewItemViewViewModel {
    var title = ""
    var dueDate = Date()
    var showAlert = false
    
    init() {
        
    }
    
    func save(){
        
        // Just double check that canSave is true or else jump out of the save function
        guard canSave else {
            return
        }
        
        // get current userID to save the todo to that user.  The user should be logged in to get here, so should definitely have a user id. We will let this new variable uID be equal to the current users uid. But, we'll put this in as a guard just to double check and jump out of the save function if for some reason there is not user id.
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create Model
        let newID = UUID().uuidString // getting our unique identifier
        let newItem = ToDoListItem( // make newItem using the ToDoListItem model struct
            id: newID,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createDueDate: Date().timeIntervalSince1970,
            isDone: false)
        
        // Save Model to database as a subcollection of the current user
        let db = Firestore.firestore() // make an instance of our database
        
        db.collection("users") // under our users collection
            .document(uID) // using the uid of our current user
            .collection("todos") // with a collection called todos
            .document(newID) // storing this todo with its own uid
            .setData(newItem.asDictionary()) // the asDictionary function is in Extensions as encodable. Set this data item into the db.

        
    } // end func save
    
    // Making a computed property "canSave" which does some save validation for us.
    var canSave: Bool {
        
        // guard that the title is not empty - and we want to consider whitespace as "empty"
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        // Date() is today's date. we are subtracting 24 hours (86,400 seconds). We want to make sure the due date can only be today or in the future, but not in the past.
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    } // end var canSave
    
}
