//
//  NewItemView.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import SwiftUI


struct NewItemView: View {
    @Bindable var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool // This is a binding because we are changing it to true with a binding from the ToDoListView.
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 10)
            
            Form {
                
                // Title
                TextField("Title", text: $viewModel.title) // We change the title property in the NewItemViewViewModel
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)// We change the dueDate property in the NewItemViewViewModel
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                TLButton(title: "Save",
                         background: .pink
                ) {
                    if viewModel.canSave {
                        viewModel.save() // We run the save function in the viewModel.
                        newItemPresented = false // We stop showing this NewItemView.
                    } else {
                        viewModel.showAlert = true
                    }
                } // end TLButton
                .padding()
            } // end Form
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields and select a due date that is today or newer.")
                ) // end Alert()
            } // end content
            ) // end .alert
        } // end VStack
    } // end body: some View
} // end struct NewItemView

#Preview {
    NewItemView(newItemPresented: Binding(get: {return true}, set: { _ in
    }))
}
