//
//  CustomSecuredField.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 16.08.2022.
//

import SwiftUI

struct CustomSecuredField: View {
    @Binding var content: String
    @State private var isHidden = true
    var placeholder: String
    var body: some View {
        HStack {
            if isHidden {
                SecureField("", text: $content)
                    .placeholder(when: content.isEmpty) {
                        HStack {
                            Image("Lock")
                                .foregroundColor(Color("Blue"))
                            Text(placeholder)
                                .foregroundColor(Color("Haiti"))
                        }
                    }
            } else {
                TextField("", text: $content)
                    .placeholder(when: content.isEmpty) {
                        HStack {
                            Image("Lock")
                                .foregroundColor(Color("Blue"))
                            Text(placeholder)
                                .foregroundColor(Color("Haiti"))
                        }
                    }
            }
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
        CustomSecuredField(content: .constant(""), placeholder: "Password")
            .previewLayout(.sizeThatFits)
    }
}
