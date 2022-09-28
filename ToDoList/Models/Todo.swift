//
//  Todo.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 27.09.2022.
//

import Foundation

struct Todo: Identifiable, Codable {
    var id = UUID().uuidString
    var text: String
    var isDone = false
    var createdAt: Date
}
