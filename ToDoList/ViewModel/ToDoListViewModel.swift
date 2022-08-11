//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 11.08.2022.
//

import Foundation
import Combine

class ToDoListViewModel: ObservableObject {
    @Published var toDoItems: [ToDoEntity] = []
    var uncompletedTasks: Int {
        toDoItems.filter{ !$0.isDone }.count
    }
    
    private var cancellable = Set<AnyCancellable>()
    
    var toDoStorage = ToDoStorage.shared
    
    init(toDoPublisher: AnyPublisher<[ToDoEntity], Never> = ToDoStorage.shared.toDoItems.eraseToAnyPublisher()) {
        cancellable.insert(
            toDoPublisher.sink { toDoItems in
                self.toDoItems = toDoItems
            }
        )
    }
    
    func addToDo(withText text: String) {
        toDoStorage.add(text: text)
    }
    
    func toggleToDo(toDo: ToDoEntity) {
        toDoStorage.update(
            withId: toDo.id!,
            isDone: !toDo.isDone
        )
    }
    
    func delete(toDo: ToDoEntity) {
        toDoStorage.delete(id: toDo.id!)
    }
}
