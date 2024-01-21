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
        
        // We will make sure the email and password seem legit first by going to the validate method below. If we pass, we return true and proceed. If we fail, we return false and the else kicks in and we return out of this login function and not continue our login.
        guard validate() else {
            return
        }
        
        // Try to log in
        Auth.auth().signIn(withEmail: email, password: password)
        
    } // end func login
    
    private func validate() -> Bool {
        // Make this an empty string when this method first gets called just in case something has previously been stored in it.
        errorMessage = ""
        
        // check that the email and password fields are not empty else store an errorMessage that can be displayed. We trim all of the whitespaces because we don't want the field to think it is filled up if we only have spaces or tabs. That's not real data to us. If the fields are not empty, the guard does not trigger and we proceed to the next check. If either the email or password fields are empty, error message says to fill in the fields and return false.
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
            !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields."
            
            return false
        } // end else
        
        // Both fields have something in them, but let's do more checking.
        // check that the email field contains and @ symbol and a . else store an errorMessage that can be displayed

        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            
            return false
        } // end else
        
        // We made it through our validation. Let's return true.
        return true
    }
} // end class
