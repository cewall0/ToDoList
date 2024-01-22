//
//  ProfileView.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import SwiftUI

struct ProfileView: View {
    var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView {
            VStack{
                // Avatar
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .frame(width: 125, height: 125)
                    .padding()
                
                // Info: name, email, member since
                VStack(alignment: .leading){
                    HStack{
                        Text("Name: ")
                            .bold()
                        Text("Chad Wallace")
                    }
                    .padding()
                    
                    HStack{
                        Text("Email: ")
                            .bold()
                        Text("Chad Wallace")
                    }
                    .padding()
                    
                    HStack{
                        Text("Member Since: ")
                            .bold()
                        Text("Chad Wallace")
                    }
                    .padding()

                }
                .padding()
                
                // signout button
                
                Button("Log Out") {
                    viewModel.logout()
                }
                .tint(.red)
                .padding()
                
                Spacer()
                
          
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
