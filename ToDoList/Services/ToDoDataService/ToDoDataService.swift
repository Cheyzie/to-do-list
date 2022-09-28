//
//  ToDoStorage.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 11.08.2022.
//

import Foundation
import Combine
import CoreData

class ToDoDataService: NSObject, ToDoDataServiceProtocol, ObservableObject {
    
    private(set) var toDoItems = CurrentValueSubject<[Todo], Never>([])
    private var toDoEntities = CurrentValueSubject<[ToDoEntity], Never>([])
    private let toDoFetchController: NSFetchedResultsController<ToDoEntity>
    private let context = PersistenceController.shared.container.viewContext
    
    static let shared = ToDoDataService()
    
    private var cancellable = Set<AnyCancellable>()
    
    private override init() {
        let request = ToDoEntity.fetchRequest()
        let sort = NSSortDescriptor(key: "createdAt", ascending: false)
        request.sortDescriptors = [sort]
        
        toDoFetchController = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: context,
            sectionNameKeyPath: nil, cacheName: nil
        )
        
        super.init()
        
        toDoFetchController.delegate = self
        
        load()
        
        toDoEntities.sink { todos in
            self.toDoItems.value = todos.compactMap { todo in
                Todo(id: todo.id!.uuidString, text: todo.text!, isDone: todo.isDone, createdAt: todo.createdAt!)
            }
        }.store(in: &cancellable)
    }
    
    func load() {
        do {
            try toDoFetchController.performFetch()
            toDoEntities.value = toDoFetchController.fetchedObjects ?? []
        } catch {
            NSLog("Error: could not fetch objects")
        }
    }
    
    func add(text: String) {
        let newToDoItem = ToDoEntity(context: context)
        
        newToDoItem.id = UUID()
        newToDoItem.text = text
        newToDoItem.isDone = false
        newToDoItem.createdAt = Date()
        
        PersistenceController.shared.saveContext()
    }
    
    func update(withId id: String, text: String? = nil, isDone: Bool? = nil) {
        guard let toDoItem = toDoEntities.value.first(where: {$0.id?.uuidString == id}) else { return }
        
        toDoItem.text = text ?? toDoItem.text
        toDoItem.isDone = isDone ?? toDoItem.isDone
        
        PersistenceController.shared.saveContext()
    }
    
    func delete(id: String) {
        guard let toDoItem = toDoEntities.value.first(where: {$0.id?.uuidString == id}) else { return }
        
        PersistenceController.shared.container.viewContext.delete(toDoItem)
        PersistenceController.shared.saveContext()
    }
}

extension ToDoDataService: NSFetchedResultsControllerDelegate {
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let toDoItems = controller.fetchedObjects as? [ToDoEntity] else { return }
        self.toDoEntities.value = toDoItems
    }
}

