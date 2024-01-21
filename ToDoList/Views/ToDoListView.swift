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
                    viewModel.showingNewItemView = true //  if clicked, we turn the showingNewItemView boolean in the viewModel to true. We then use this true value to show the sheet for the NewItemView.
                } label: {
                    Image(systemName: "plus") // This looks like a plus sign
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) { // if isPresented is true, we will show this sheet (the view inside the curly brackets). It is a binding to change the value in our viewModel.
                NewItemView(newItemPresented: $viewModel.showingNewItemView) // We show the NewItemView and pass in the value of true for the newItemPresented boolean which is a binding in NewItemView as it is tied to the showingNewItemView boolean who's source of truth is in the ToDoListViewViewModel. This will tell that view to be displayed until we are done with it.
            }
        }
    }
}

#Preview {
    ToDoListView(userID: "")
}
