//
//  UserStateViewModel.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 20.09.2022.
//

import SwiftUI
import Combine

class UserStateViewModel: ObservableObject {
    @Published var isAuth = false
    private var cancellable = Set<AnyCancellable>()
    
    init(authService: AuthServiceProtocol = FirebaseAuthService.shared) {
        authService.isAuth.sink { isAuth in
            self.isAuth = isAuth
        }.store(in: &cancellable)
    }
}
