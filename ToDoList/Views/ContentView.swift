//
//  ContentView.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 05.08.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var viewModel = UserStateViewModel()
    
    var body: some View {
        if viewModel.isAuth {
            ToDoList()
        } else {
            Welcome()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
