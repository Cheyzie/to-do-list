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
                        .foregroundColor(Color("Blue"))
                        .position(x: 0.3 * geometry.size.width, y: -0.5 * geometry.size.width)
                    VStack {
                        Image("Welcome")
                            .resizable()
                            .frame(width: 0.45 * geometry.size.width, height: 0.45 * geometry.size.width)
                            .padding(45)
                            .background {
                                Circle()
                                    .foregroundColor(.white)
                                    .shadow(radius: 5)
                        }
                        Text("Start enjoying a more organized life")
                            .font(.custom("WorkSans-Bold", size: 35))
                            .multilineTextAlignment(.center)
                        Text("Plan, organize, track, in one visual, collaborative space")
                            .font(.custom("WorkSans-Medium", size: 20))
                            .foregroundColor(Color("Grey"))
                            .multilineTextAlignment(.center)
                            .padding(.top, 0.5)
                        NavigationLink {
                            ToDoList()
                                .navigationBarHidden(true)
                        } label: {
                            Text("Get started")
                                .font(.custom("WorkSans-Bold", size: 18))
                                .foregroundColor(.white)
                                .frame(width: 183, height: 55, alignment: .center)
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color("Blue"))
                                }
                        }
                        .padding(.vertical, 20)
                        Spacer()
                    }
                    .padding(.horizontal, 3)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
