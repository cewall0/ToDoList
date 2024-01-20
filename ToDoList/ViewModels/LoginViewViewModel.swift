//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import Foundation
import Observation // need for our @Observable wrapper
import FirebaseAuth

@Observable
class LoginViewViewModel {
    var email = ""
    var password = ""
    var errorMessage = ""
    
    
    // a basic initializer that uses the default variables
    init() {
        
    } // end init
    
    func login() {
        
        guard validate() else {
            return
        }
        
        // Try to log in
        Auth.auth().signIn(withEmail: email, password: password)
        
    } // end func login
    
    private func validate() -> Bool {
        // Make this an empty string when this method first gets called just in case something has previously been stored in it.
        errorMessage = ""
        
        // check that the email and password fields are not empty else store an errorMessage that can be displayed
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
            !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields."
            
            return false
        } // end else
        
        // check that the email field contains and @ symbol and a . else store an errorMessage that can be displayed

        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            
            return false
        } // end else
        
        return true
    }
} // end class
