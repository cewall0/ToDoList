//
//  NewItemView.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import SwiftUI

struct NewItemView: View {
    @Bindable var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool

    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 10)
            
            Form {
                
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                TLButton(title: "Save", 
                         background: .pink) {
                    viewModel.save()
                    newItemPresented = false
                } // end TLButton
                .padding()
            } // end Form
        } // end VStack
    } // end body: some View
} // end struct NewItemView

#Preview {
    NewItemView(newItemPresented: Binding(get: {return true}, set: { _ in
    }))
}
