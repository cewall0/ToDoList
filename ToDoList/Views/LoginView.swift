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
    
    // make instance of our LoginViewViewModel class so we can use it in this view.  It must be @Bindable to create a binding since the textfields will write to the email and password fields.
@Bindable var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView { // we need this because we will try to go to other views from here - like RegisterView if we need to register a user.
            
        VStack{
            // Header which uses our HeaderView struct.
            HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)
            
           
            // Login Form
            Form{
                
                // The errorMessage in this viewModel starts as an empty string. It stores an error message if when the login method is called and either the name or password fields are empty. Therefore, if it contains an error message (the if statement is checking at the errorMessage in this view model is NOT empty), the view here will display that error message at the top of the form.
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                TextField("Email Address", text: $viewModel.email) // we set the email for the user in the vieModel.
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled() // let's not autocorrect their name. That would be frustrating.
                    .autocapitalization(.none) // let's not autocapitalize the first letter
                
                // SecureField is like a textfield but for passwords.
                SecureField("Password", text: $viewModel.password) // we set the password for the user in the viewModel.
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled() // No sense trying to autocorrect their password which should not be a normal word anyway.  :)

                TLButton(
                    title: "Log in",
                    background: .blue
                ) {
                    viewModel.login() // we run the login method in the viewModel. It does some validation checking then tries to login using firebaseAuth.
                }
                .padding()
                
            } // end Form
            .offset(y: -50)
            
            // Create Account if we have not previously registered.
            VStack{
                
                Text("New around here?")
                
                NavigationLink("Create an account") {
                    RegisterView() // implement the RegisterView. We need this inside of a NavigationView in order to go to it.
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
