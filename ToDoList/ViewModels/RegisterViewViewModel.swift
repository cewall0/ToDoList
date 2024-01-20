//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
import Observation

@Observable
class RegisterViewViewModel{
    var name = ""
    var email = ""
    var password = ""

    
    init() {} // end init
    
    func register() {
        guard validate() else { // if it fails validation, it will jump out of the function
            return
        }
        
        // using firebaseAuth.  Creating user with email/password and completion block. The completion block gives us our newly created user results and an error/ We make sure we have a new user with the guard statement chekcing that there is a userID that is the newly created userresult is unwrapped and the user has a unique identifer (uid). If not, then we return to jump out.
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userID)
        }
    } // end func register
    
    // Create our own model for a user. Make a data object that represents the user and insert it into the database.
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        
        // Make sure nothing is empty
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        // help validate email looks correct
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        // make sure password has at least 6 characters
        guard password.count >= 6  else {
            return false
        }
        
        return true // if everything looks good, proceed and return true
    } // end func validate
    
}


