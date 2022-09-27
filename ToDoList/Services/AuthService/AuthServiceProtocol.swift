//
//  FirebaseAuthServiceProtocol.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 17.09.2022.
//

import Foundation
import Combine
import FirebaseAuth

protocol AuthServiceProtocol {
    var isAuth: CurrentValueSubject<Bool, Never> {get}
    var user: CurrentValueSubject<User?, Never> {get}
    var errMsg: PassthroughSubject<String, Never> {get}
    
    func signIn(email: String, password: String)
    func signUp(username: String, email: String, password: String)
    func signOut()
    func changeUsername(username: String)
    func deleteAccount()
}
