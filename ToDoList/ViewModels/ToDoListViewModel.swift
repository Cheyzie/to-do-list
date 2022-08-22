//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 11.08.2022.
//

import Foundation
import Combine

class ToDoListViewModel: ObservableObject {
    
    private let toDoDataService: ToDoDataServiceProtocol
    
    @Published var toDoItems: [ToDoEntity] = []
    @Published var searchQuery = ""
    
    var uncompletedTasks: Int {
        filteredToDoItems.filter{ !$0.isDone }.count
    }
    var filteredToDoItems: [ToDoEntity] {
        if searchQuery.isEmpty {
            return toDoItems
        } else {
            return toDoItems.filter({$0.text?.lowercased().contains(searchQuery.lowercased()) ?? false})
        }
    }
    
    private var cancellable = Set<AnyCancellable>()
    
    init(toDoDataService: ToDoDataServiceProtocol = ToDoDataService.shared) {
        self.toDoDataService = toDoDataService
        toDoDataService.toDoItems.sink { toDoItems in
            self.toDoItems = toDoItems
        }.store(in: &cancellable)
    }
    
    func addToDo(withText text: String) {
        toDoDataService.add(text: text)
    }
    
    func toggle(toDo: ToDoEntity) {
        toDoDataService.update(
            withId: toDo.id!,
            isDone: !toDo.isDone
        )
    }
    
    func delete(toDo: ToDoEntity) {
        toDoDataService.delete(id: toDo.id!)
    }
}
