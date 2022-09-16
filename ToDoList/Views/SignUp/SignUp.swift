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
                                .foregroundColor(.customBlue)
                            Text("Email")
                                .foregroundColor(.customHaiti)
                        }
                    }
                CustomSecuredField(text: $viewModel.password) {
                        HStack {
                            Image("Lock")
                                .foregroundColor(.customBlue)
                            Text("Password")
                                .foregroundColor(.customHaiti)
                        }
                    }
                CustomSecuredField(text: $viewModel.passwordConfirmation) {
                        HStack {
                            Image("Lock")
                                .foregroundColor(.customBlue)
                            Text("Confirm Password")
                                .foregroundColor(.customHaiti)
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
                                .foregroundColor(.customBlue)
                                .shadow(radius: 5)
                        }
                }
                .padding(.vertical, 30)
                HStack {
                    Text("Don't have an account?")
                        .font(.custom("WorkSans-SemiBold", size: 12))
                        .foregroundColor(.customGrey)
                    NavigationLink {
                        SignIn()
                            .navigationBarHidden(true)
                    } label: {
                        Text("Login")
                            .font(.custom("WorkSans-SemiBold", size: 12))
                            .foregroundColor(.customBlue)
                    }
                }
                NavigationLink(
                    isActive: $viewModel.isAuth,
                    destination: {
                        ToDoList()
                            .navigationBarHidden(true)
                        
                    },
                    label: {}
                )
                Spacer()
            }
            .padding()
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
