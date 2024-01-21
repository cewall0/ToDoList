//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import Foundation
import Observation
import FirebaseAuth

@Observable
class MainViewViewModel {
    var currentUserID: String = ""
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){ // initializing this class and the handler property with either a user's unique ID (if someone is signed in) or with an empty, nil, "" string.
        
        // Monitor authentication changes using firebase
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        }
    }
    
    // this allows the MainView to check if we have a user signed in to show the Main View, else we will show the LoginView
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil // if the currentUser does not equal nil, we are signed in.
    }
}
