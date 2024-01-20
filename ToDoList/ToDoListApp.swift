//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

@main
struct ToDoListApp: App {
    
    // We "stub out" the initializer here. It goes to the GoogleService-Info.plist file uses it to configure, but if I did not bring the .plist file in, this would cause a crash.
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
