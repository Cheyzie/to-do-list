//
//  SignIn.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 16.08.2022.
//

import SwiftUI

struct SignIn: View {
    @StateObject private var viewModel = SignInViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Image("Auth")
                    .padding()
                Spacer()
                Text("SIGN IN")
                    .font(.custom("WorkSans-Bold", size: 24))
                    .foregroundColor(.white)
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
                Button {
                    viewModel.signIn()
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
                .navigationBarHidden(true)
                .padding(.vertical, 30)
                HStack {
                    Text("Don't have an account?")
                        .font(.custom("WorkSans-SemiBold", size: 12))
                        .foregroundColor(Color("LightGrey"))
                    NavigationLink {
                        SignUp()
                            .navigationBarHidden(true)
                    } label: {
                        Text("Register now")
                            .font(.custom("WorkSans-SemiBold", size: 12))
                            .foregroundColor(.white)
                    }
                }
                NavigationLink(
                    isActive: $viewModel.login,
                    destination: {
                        ToDoList()
                            .navigationBarHidden(true)
                    },
                    label: {}
                )
                Spacer()
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
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
