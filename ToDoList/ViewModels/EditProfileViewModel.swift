//
//  EditProfileViewModel.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 22.09.2022.
//

import Foundation
import Combine
import FirebaseAuth

class EditProfileViewModel: ObservableObject {
    @Published var username = ""
    
    var authService: AuthServiceProtocol
    
    var cancellable = Set<AnyCancellable>()
    
    init(authService: AuthServiceProtocol = FirebaseAuthService.shared) {
        self.authService = authService
        
        authService.user.sink { [weak self] user in
            guard let self = self else { return }
            self.username = user?.displayName ?? ""
        }.store(in: &cancellable)
    }
    
    func signOut() {
        authService.signOut()
    }
    
    func saveChanges() {
        authService.changeUsername(username: username)
    }
    
    func deleteAccount() {
        authService.deleteAccount()
    }
}
