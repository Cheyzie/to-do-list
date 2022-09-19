//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 05.08.2022.
//

import SwiftUI
import Firebase

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
