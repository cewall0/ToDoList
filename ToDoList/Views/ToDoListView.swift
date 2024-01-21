//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    @Bindable var viewModel: ToDoListViewViewModel // viewModel is of type ToDoListViewViewModel (we are not instantiating here. We do that in the init a bit later down.
    @FirestoreQuery var items: [ToDoListItem] // A query that continuously listens for items if type: an array of the ToDoListItem model structs. This list differs depending on the user signed in.
    
    init(userID: String){ // we initialize this struct. we must pass in a string that is the current user's userID. We use that userID to get all of the titems. The underscore of the self._items is convention for a variable for a wrapper (@FirestoreQuery).
        self._items = FirestoreQuery(
            collectionPath: "users/\(userID)/todos" // This is the path to the idems in the todos collection of the db for the current user.
        )
        // And we will also instantiate the viewModel and pass in the user's userID.
        self.viewModel = ToDoListViewViewModel(userID: userID)
    } // ene init
    
    var body: some View {
        NavigationView {
            VStack{
                // a list of our todo items
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                // Delete
                                viewModel.delete(id: item.id) // pass the item's id to the viewModel to run the delete function.
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
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
    ToDoListView(userID: "YJjkbb9diSabQAmCewSBGg2lV0d2") // copied userID for one user from the firebase db.
}
