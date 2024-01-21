//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import Foundation
import Observation
import FirebaseFirestore

// viewModel for list of items view
// primary tab
@Observable
class ToDoListViewViewModel {
    var showingNewItemView = false
    
    private var userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    
    
    /// Delete todolist item. with item ID to delete being passed in.
    /// 
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(id)
            .delete()
    } // end func delete
} // end class
