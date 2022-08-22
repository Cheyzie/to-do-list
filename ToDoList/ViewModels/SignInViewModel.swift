//
//  SignInViewModel.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 19.08.2022.
//

import Foundation

class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var login: Bool = false
    
    func signIn() {
        self.login = true
    }
}
