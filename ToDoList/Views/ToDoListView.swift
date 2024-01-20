//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import SwiftUI

struct ToDoListView: View {
    var viewModel = ToDoListViewViewModel()
    
    private let userID: String
    
    init(userID: String){
        self.userID = userID
    }
    
    var body: some View {
        NavigationView {
            VStack{
                
            }
            .navigationTitle("To Do List") // title at top of Navigation View
            .toolbar { // at top of screen
                Button {
                    // action
                } label: {
                    Image(systemName: "plus")
                }
            }
        }

    }
}

#Preview {
    ToDoListView(userID: "")
}
