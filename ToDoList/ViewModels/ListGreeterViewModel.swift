//
//  ListGreeterViewModel.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 21.09.2022.
//

import Foundation
import Combine
import FirebaseAuth

class ListGreeterViewModel: ObservableObject {
    @Published var user: User?
    var authService: AuthServiceProtocol
    private var cancellable = Set<AnyCancellable>()
    
    init(authService: AuthServiceProtocol = FirebaseAuthService.shared) {
        self.authService = authService
        authService.user.sink { [weak self] user in
            guard let self = self else { return }
            self.user = user
        }.store(in: &cancellable)
    }
}
