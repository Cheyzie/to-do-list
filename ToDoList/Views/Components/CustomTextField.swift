//
//  CustomTextField.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 18.08.2022.
//

import SwiftUI

struct CustomTextField<Content: View>: View {
    @Binding var text: String
    
    var fieldPlaceholder: () -> Content
    var body: some View {
        TextField("", text: $text)
            .placeholder(when: text.isEmpty, placeholder: fieldPlaceholder)
            .padding()
            .font(.custom("WorkSans-Medium", size: 14))
            .frame(height: 40)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .shadow(radius: 3)
            }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant("")) {
            Text("Text")
        }
    }
}
