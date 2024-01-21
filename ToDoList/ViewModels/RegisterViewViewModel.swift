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

    
    init() {} // generic initializer for this class
    
    func register() {
        guard validate() else { // if it passes validation (function below returns true) it keeps going in the register function, else if it fails validation (function below returns false), it will jump out of the function
            return
        }
        
        // Using firebaseAuth.  Creating user with email/password and completion block getting unique user id. The completion block gives us our newly created user (with an email and password), calls this new user result, gets a uid (unique ID) for this created user, guards that it actually does that, then takes this newly created user (self) and uses the insertUserRecord method (below) to insert it into Firestore by passing along the userID. -- The results and an error/ We make sure we have a new user with the guard statement checking that there is a userID- that is the newly created userresult exists with a user with a unique identifer (uid). If not, then we return to jump out of the function. [weak self] is so we don't leak memory. This needs done sometimes when we point to self.
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userID)
        }
    } // end func register
    
    // Create our own model for a user. Make a data object that represents the user and insert it into the database.
    private func insertUserRecord(id: String) {
        
        // instantiate the User struct calling it newUser
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()  // instantiate the Firestore as db (data base)
        
        db.collection("users") // storing the user in a collection in our database called users
            .document(id) // document attached to this user that will contain the UID
            .setData(newUser.asDictionary()) // see Extensions Encodable of the Codable data in the User Model. This sets the data into firestore as a dictionary with key:value pairs
    }
    
    private func validate() -> Bool { // validate method that will pass back a boolean of true (passing validation) or false (failing validation)
        
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


