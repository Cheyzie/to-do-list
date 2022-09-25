//
//  EditProfile.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 21.09.2022.
//

import SwiftUI

struct EditProfile: View {
    @StateObject var viewModel = EditProfileViewModel()
    
    var body: some View {
        VStack {
            Image("avatar")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            CustomTextField(text: $viewModel.username) {
                HStack {
                    Image("User")
                        .foregroundColor(.customBlue)
                    Text("Username")
                        .foregroundColor(.customHaiti)
                }
            }
            .padding(.vertical)
            Button {
                viewModel.saveChanges()
            } label: {
               Text("Save")
                    .modifier(ButtonLabel())
                    .foregroundColor(.customGreen)
                    
            }
            Spacer()
            Button {
                viewModel.signOut()
            } label: {
                Text("Log out")
                    .modifier(ButtonLabel())
                    .foregroundColor(.customHaiti)
                     
            }
            Button {
                viewModel.deleteAccount()
            } label: {
                Text("Delete account")
                    .modifier(ButtonLabel())
                    .foregroundColor(.customRed)
                     
            }
        }
        .padding()
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
