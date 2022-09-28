//
//  Welcome.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 09.08.2022.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Circle()
                        .frame(width: 2 * geometry.size.width, height: 2 * geometry.size.width)
                        .foregroundColor(.customBlue)
                        .position(x: 0.25 * geometry.size.width, y: -0.35 * geometry.size.width)
                    VStack(alignment: .center) {
                        Image("Welcome")
                            .resizable()
                            .frame(width: 0.45 * geometry.size.width, height: 0.45 * geometry.size.width)
                            .padding(0.15 * geometry.size.width)
                            .background {
                                Circle()
                                    .foregroundColor(.white)
                                    .shadow(radius: 5)
                        }
                            .padding(.top, 30)
                        Text("Start enjoying a more organized life")
                            .font(.custom("WorkSans-Bold", size: 35))
                            .padding(.vertical, 10)
                        Text("Plan, organize, track, in one visual, collaborative space")
                            .font(.custom("WorkSans-Medium", size: 20))
                            .foregroundColor(.customGrey)
                            .padding(.vertical, 5)
                        HStack {
                            NavigationLink {
                                SignIn()
                                    .navigationBarHidden(true)
                            } label: {
                                Text("Sign In")
                                    .font(.custom("WorkSans-Bold", size: 18))
                                    .foregroundColor(.white)
                                    .frame(width: 0.47 * geometry.size.width, height: 55, alignment: .center)
                                    .background {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(.customBlue)
                                    }
                            }
                            NavigationLink {
                                SignUp()
                                    .navigationBarHidden(true)
                            } label: {
                                Text("Sign Up")
                                    .font(.custom("WorkSans-Bold", size: 18))
                                    .foregroundColor(.customBlue)
                                    .frame(width: 0.46 * geometry.size.width, height: 54, alignment: .center)
                                    .background {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(lineWidth: 3)
                                            .foregroundColor(.customBlue)
                                    }
                            }
                        }
                        .padding(.vertical, 50)
                    }
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 3)
                }
                .ignoresSafeArea()
            }
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
