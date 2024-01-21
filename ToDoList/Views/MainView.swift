//
//  MainView.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import SwiftUI

struct MainView: View {
    
    var viewModel = MainViewViewModel()
    
    var body: some View {

        // checking if someone is signed in (viewModel.isSignedIn is true if someone is signed in) and mamking sure the current userID is not empty - then we can show the account View tabs. Else, someone needs to log in to we will show the login view.
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
            // signed in so go to the ToDoList
            accountView // see the computer property below with the @ViewBuilder closure/wrapper. This abstracts the tab view
            
        } else { // we still need to log in.
            LoginView()
        }

    } // end body: some View
    
    @ViewBuilder // ViewBuilder is a closure that allows multiple child views to be build dynamically in one parent view.
    var accountView: some View { // made computed property instead of function
        TabView{ // puts these views into a tab bar
            ToDoListView(userID: viewModel.currentUserID)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
    
} // end struct MainView

#Preview {
    MainView()
}
