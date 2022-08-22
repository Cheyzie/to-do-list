//
//  SignUpViewModel.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 19.08.2022.
//

import Foundation


class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordConfirmation: String = ""
    @Published var isAuth = false
    
    func signUp() {
        self.isAuth = true
    }
}
