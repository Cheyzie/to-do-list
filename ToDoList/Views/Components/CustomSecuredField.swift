//
//  CustomSecuredField.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 16.08.2022.
//

import SwiftUI

struct CustomSecuredField<Content: View>: View {
    @Binding var text: String
    @State private var isHidden = true
    
    var fieldPlaceholder: () -> Content
    
    var body: some View {
        HStack {
            Group {
                if isHidden {
                    SecureField("", text: $text)
                } else {
                    TextField("", text: $text)
                }
            }
            .placeholder(
                when: text.isEmpty,
                placeholder: fieldPlaceholder
            )
            Button {
                isHidden.toggle()
            } label: {
                Image(systemName: isHidden ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(isHidden ? Color("Grey") : Color("Blue"))
            }
        }
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

struct CustomSecuredField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecuredField(text: .constant("")){
            Text("Password")
        }
            .previewLayout(.sizeThatFits)
    }
}
