//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
import Observation

/// viewModel for a single to do list item view (each row in items list)
@Observable
class ToDoListItemViewViewModel {
    init() {
        
    }
    
    
    func toggleIsDone(item: ToDoListItem){  // ToDoListItem is the model of the ToDoListItem
        var itemCopy = item // item is a let, so we make a copy of it so we can change it.
        itemCopy.setDone(!item.isDone) // Take this copy of item, all of its data stays the same except the setDone boolean property which we set to the opposite flag
        
        // Now, let's get the uid for the user, but protect with a guard that will return out of the function if there is no uid.
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        // We have a uid, so let's update the database for the isDone bool
        let db = Firestore.firestore() // instantiate the database
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    } // end func toggleIsDone
    

}
