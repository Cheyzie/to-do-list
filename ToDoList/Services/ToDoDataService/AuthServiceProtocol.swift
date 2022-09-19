//
//  FirebaseAuthServiceProtocol.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 17.09.2022.
//

import Foundation
import Combine

protocol AuthServiceProtocol {
    var isAuth: CurrentValueSubject<Bool, Never> {get}
    var errMsg: PassthroughSubject<String, Never> {get}
    
    func signIn(email: String, password: String)
    func signUp(email: String, password: String)
}
