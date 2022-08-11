//
//  ToDoStorage.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 11.08.2022.
//

import Foundation
import Combine
import CoreData

class ToDoStorage: NSObject, ObservableObject {
    var toDoItems = CurrentValueSubject<[ToDoEntity], Never>([])
    private let toDoFetchController: NSFetchedResultsController<ToDoEntity>
    let context = PersistenceController.shared.container.viewContext
    static let shared = ToDoStorage()
    
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
    }
    
    func load() {
        do {
            try toDoFetchController.performFetch()
            toDoItems.value = toDoFetchController.fetchedObjects ?? []
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
    
    func update(withId id: UUID, text: String? = nil, isDone: Bool? = nil) {
        guard let toDoItem = toDoItems.value.first(where: {$0.id == id}) else { return }
        
        toDoItem.text = text ?? toDoItem.text
        toDoItem.isDone = isDone ?? toDoItem.isDone
        
        PersistenceController.shared.saveContext()
    }
    
    func delete(id: UUID) {
        guard let toDoItem = toDoItems.value.first(where: {$0.id == id}) else { return }
        
        PersistenceController.shared.container.viewContext.delete(toDoItem)
        PersistenceController.shared.saveContext()
    }
}

extension ToDoStorage: NSFetchedResultsControllerDelegate {
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let toDoItems = controller.fetchedObjects as? [ToDoEntity] else { return }
        self.toDoItems.value = toDoItems
    }
}

