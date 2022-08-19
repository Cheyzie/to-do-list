//
//  SignUp.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 16.08.2022.
//

import SwiftUI

struct SignUp: View {
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Auth")
                Spacer()
                Text("Sign Up")
                    .font(.custom("WorkSans-Bold", size: 22))
                CustomTextField(text: $viewModel.email) {
                        HStack {
                            Image("Message")
                                .foregroundColor(Color("Blue"))
                            Text("Email")
                                .foregroundColor(Color("Haiti"))
                        }
                    }
                CustomSecuredField(text: $viewModel.password) {
                        HStack {
                            Image("Lock")
                                .foregroundColor(Color("Blue"))
                            Text("Password")
                                .foregroundColor(Color("Haiti"))
                        }
                    }
                CustomSecuredField(text: $viewModel.passwordConfirmation) {
                        HStack {
                            Image("Lock")
                                .foregroundColor(Color("Blue"))
                            Text("Confirm Password")
                                .foregroundColor(Color("Haiti"))
                        }
                    }
                
                Button {
                    viewModel.signUp()
                } label: {
                    Text("SIGNUP")
                        .font(.custom("WorkSans-SemiBold", size: 14))
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background {
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(Color("Blue"))
                                .shadow(radius: 5)
                        }
                }
                .navigationBarHidden(true)
                .padding(.vertical, 30)
                HStack {
                    Text("Don't have an account?")
                        .font(.custom("WorkSans-SemiBold", size: 12))
                        .foregroundColor(Color("Grey"))
                    NavigationLink {
                        SignIn()
                    } label: {
                        Text("Login")
                            .font(.custom("WorkSans-SemiBold", size: 12))
                            .foregroundColor(Color("Blue"))
                    }
                    .navigationBarHidden(true)
                }
                NavigationLink(
                    isActive: $viewModel.isAuth,
                    destination: {ToDoList()},
                    label: {}
                )
                Spacer()
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
