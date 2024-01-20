//
//  RegisterView.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            // header
            HeaderView(title: "Register", subtitle: "Start organizing to dos", angle: -15, background: .orange)
            
            Form {
                TextField("Full Name", text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(
                    title: "Register",
                    background: .green
                ) {
                    // Attempt Registration
                } // end TLButton
                .padding()
                
            } // end Form
            .offset(y: -50)
            
            Spacer()
            
        } // end VStack
    }
}

#Preview {
    RegisterView()
}
