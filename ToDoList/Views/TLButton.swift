//
//  TLButton.swift
//  ToDoList
//
//  Created by Chad Wallace on 1/20/24.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            } // end ZStack
        } // end label

    } // end body Some view
} // end struct TLButton

#Preview {
    TLButton(title: "Title", background: .pink) {
        // Action
    }
}
