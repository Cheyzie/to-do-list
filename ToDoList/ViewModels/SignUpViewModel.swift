//
//  SignUpViewModel.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 19.08.2022.
//

import Foundation
import FirebaseAuth
import Combine

class SignUpViewModel: ObservableObject {
    var authService: AuthServiceProtocol
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordConfirmation: String = ""
    
    @Published var isAuth = false
    @Published var errMsg = ""
    
    private var cancellable = Set<AnyCancellable>()
    
    init(authService: AuthServiceProtocol = FirebaseAuthService.shared) {
        self.authService = authService
        authService.isAuth.sink { isAuth in
            self.isAuth = isAuth
        }.store(in: &cancellable)
        authService.errMsg.sink { errMsg in
            self.errMsg = errMsg
        }.store(in: &cancellable)
    }
    
    func signUp() {
        if password == passwordConfirmation {
            authService.signUp(email: email, password: password)
        } else {
            errMsg = "Password not match."
        }
    }
}
