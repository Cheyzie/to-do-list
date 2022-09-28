//
//  ToDoDataServiceProtocol.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 15.08.2022.
//

import Foundation
import Combine

protocol ToDoDataServiceProtocol {
    var toDoItems: CurrentValueSubject<[Todo], Never> { get }
    
    func add(text: String)
    func update(withId id: String, text: String?, isDone: Bool?)
    func delete(id: String)
}

extension ToDoDataServiceProtocol {
    func update(withId id: String, text: String? = nil, isDone: Bool? = nil) {
        update(withId: id, text: text, isDone: isDone)
    }
}
