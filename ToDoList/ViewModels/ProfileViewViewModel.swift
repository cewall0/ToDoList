//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import Foundation
import Observation
import FirebaseAuth
import FirebaseFirestore

@Observable
class ProfileViewViewModel {
    
    var user: User? = nil
    
    // generic initializer for the class
    init() {
        
    }
    
    func fetchUser() {
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userID).getDocument { snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            } // end else
            
            DispatchQueue.main.async {
                self.user = User( // instructions said this should be self?.user =
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0)
            }
        } // db.collection
    }
    
    // logout the user
    func logout(){
        
    } // end func logout
    
} // end class
