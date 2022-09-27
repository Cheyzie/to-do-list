//
//  SignInViewModel.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 19.08.2022.
//

import Foundation
import Combine

class SignInViewModel: ObservableObject {
    var authService: AuthServiceProtocol
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var isAuth: Bool = false
    @Published var errMsg: String = ""
    
    private var cancellable = Set<AnyCancellable>()
    
    init(authService: AuthServiceProtocol = FirebaseAuthService.shared) {
        self.authService = authService
        
        authService.errMsg.sink { errMsg in
            self.errMsg = errMsg
        }.store(in: &cancellable)
        authService.isAuth.sink { isAuth in
            self.isAuth = isAuth
        }.store(in: &cancellable)
    }
    
    func signIn() {
        authService.signIn(email: email, password: password)
    }
}
