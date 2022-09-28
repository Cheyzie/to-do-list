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
    var user = CurrentValueSubject<User?, Never>(nil)
    var errMsg = PassthroughSubject<String, Never>()
    
    static let shared = FirebaseAuthService()
    
    init() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else {
                return
            }
            self.user.value = user
            self.isAuth.value = user != nil
        }
        self.isAuth.value = Auth.auth().currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else {return}
            if let error = error {
                self.errMsg.send(error.localizedDescription)
            } else if authResult != nil {
                self.isAuth.value = true
            }
        }
    }
    
    func signUp(username: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            if let error = error {
                self.errMsg.send(error.localizedDescription)
            } else if authResult != nil {
                self.user.value = Auth.auth().currentUser
                self.changeUsername(username: username)
                self.isAuth.value = true
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError)")
        }
    }
    
    func changeUsername(username: String) {
        let changeRequest = user.value?.createProfileChangeRequest()
        changeRequest?.displayName = username
        changeRequest?.commitChanges { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                print("Error changing username: \(error)")
                return
            }
            self.user.value = Auth.auth().currentUser
        }
    }
    
    func deleteAccount() {
        let user = self.user.value
        user?.delete { error in
            if let error = error {
                print("Error deleting user: \(error)")
            }
        }
    }
}
