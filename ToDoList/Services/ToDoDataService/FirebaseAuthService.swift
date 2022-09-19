//
//  FirebaseAuth.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 17.09.2022.
//

import Foundation
import FirebaseAuth
import Combine

class FirebaseAuthService: AuthServiceProtocol {
    var isAuth = CurrentValueSubject<Bool, Never>(false)
    var errMsg = PassthroughSubject<String, Never>()
    
    static let shared = FirebaseAuthService()
    
    init() {
        self.isAuth.value = false
    }
    
    func signIn(email: String, password: String) {
        return
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errMsg.send(error.localizedDescription)
                print(error)
            } else if authResult != nil {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = email
                changeRequest?.commitChanges { error in
                    if let error = error {
                        print(error)
                    }
                }
                self.isAuth.value = true
            }
        }
    }
}
