//
//  SignIn.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 16.08.2022.
//

import SwiftUI

struct SignIn: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isRemember = false
    var body: some View {
        VStack(alignment: .center) {
            Image("AuthScreenImg")
                .padding()
            Text("SIGN IN")
                .font(.custom("WorkSans-Bold", size: 24))
                .foregroundColor(.white)
            TextField("", text: $email)
                .placeholder(when: email.isEmpty) {
                    HStack {
                        Image("Message")
                            .foregroundColor(Color("Blue"))
                        Text("Email")
                            .foregroundColor(Color("Haiti"))
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
            CustomSecuredField(content: $password, placeholder: "Password")
            Button {
                
            } label: {
                Text("LOGIN")
                    .font(.custom("WorkSans-SemiBold", size: 14))
                    .frame(width: 200, height: 50)
                    .background {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                    }
            }
            .padding(.top, 30)
        }
        .frame(maxHeight: .infinity)
        .foregroundColor(Color("Haiti"))
        .padding(20)
        .background {
            Rectangle()
                .ignoresSafeArea()
                .scaledToFill()
                .foregroundColor(Color("Blue"))
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
