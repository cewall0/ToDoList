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
                
                // The errorMessage in this viewModel starts as an empty string. It stores an error message if when the login method is called and either the name or password fields are empty. Therefore, if it contains an error message (the if statement is checking at the erroeMessage in this view model is NOT empty), the view here will display that error message at the top of the form. 
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
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
                    viewModel.login()
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
