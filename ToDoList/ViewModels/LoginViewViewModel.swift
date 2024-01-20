//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import Foundation
import Observation // need for our @Observable wrapper

@Observable
class LoginViewViewModel {
    var email = ""
    var password = ""
    
    // a basic initializer that uses the default variables
    init() {
        
    } // end init
} // end class
