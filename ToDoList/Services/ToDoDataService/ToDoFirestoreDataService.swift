//
//  ToDoFirestoreDataService.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 27.09.2022.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class ToDoFirebaseDataService: ToDoDataServiceProtocol {
    var toDoItems = CurrentValueSubject<[Todo], Never>([])
    
    private var authService: FirebaseAuthService
    private let store = Firestore.firestore()
    
    static let shared = ToDoFirebaseDataService()
    
    private var listener: ListenerRegistration?
    
    var cancellable = Set<AnyCancellable>()
    
    init() {
        authService = FirebaseAuthService.shared
        authService.user.sink { [weak self] _ in
            guard let self = self else { return }
            self.get()
        }.store(in: &cancellable)
    }
    
    func get() {
        if let listener = listener {
            listener.remove()
        }
        if let id = authService.user.value?.uid {
            self.listener = store.collection("users/\(id)/todos")
                .addSnapshotListener { snapshot, error in
                    if let error = error {
                        print("Error in todos subscription: \(error.localizedDescription)")
                        return
                    }
                    self.toDoItems.value = snapshot?.documents.compactMap { document in
                        try? document.data(as: Todo.self)
                    } ?? []
            }
        }
    }
    
    func add(text: String) {
        let todo = Todo(text: text, createdAt: Date())
        do {
            if let id = authService.user.value?.uid {
                let _ = try store.collection("users/\(id)/todos").document(todo.id).setData(from: todo)
            }
        } catch {
            print("Unable to add todo: \(error.localizedDescription)")
        }
    }
    
    func update(withId id: String, text: String? = nil, isDone: Bool? = nil) {
        if let uid = authService.user.value?.uid {
            let todoRef = store.collection("users/\(uid)/todos").document(id)
            var newData: [AnyHashable: Any] = [:]
            
            if let text = text {
                newData["text"] = text
            }
            
            if let isDone = isDone {
                newData["isDone"] = isDone
            }
            
            todoRef.updateData(newData) { err in
                if let err = err {
                    print("Error updating todo: \(err.localizedDescription)")
                }
            }
        }
    }
    
    func delete(id: String) {
        if let uid = authService.user.value?.uid {
            store.collection("users/\(uid)/todos").document(id).delete { error in
                if let error = error {
                    print("Error on deleting todo item: \(error.localizedDescription)")
                }
            }
        }
    }
    
    
}
