//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import SwiftUI

struct ToDoListView: View {
    @Bindable var viewModel = ToDoListViewViewModel()
    
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
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }

    }
}

#Preview {
    ToDoListView(userID: "")
}
