//
//  LoginView.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import SwiftUI
import Observation

struct LoginView: View {
    
    // Variables
    
    // make instance of our LoginViewViewModel class so we can use it in this view.  It must be @Bindable to create a binding since the textfields will write to it.
@Bindable var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            
        
        VStack{
            // Header
            HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)
            
            // Login Form
            Form{
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()

                TLButton(
                    title: "Log in",
                    background: .blue
                ) {
                    // Attempt Log in
                }
                .padding()
                
            } // end Form
            .offset(y: -50)
            
            // Create Account
            VStack{
                
                Text("New around here?")
                
                NavigationLink("Create an account") {
                    RegisterView()
                }
                
              
                
            } // end VStack for Create Account
            .padding(.bottom, 50)
            
            Spacer()
            
        } // end VStack
            
        } // end Navigation View
            
    } // end body: Some View
}// end Struct

#Preview {
    LoginView()
}
