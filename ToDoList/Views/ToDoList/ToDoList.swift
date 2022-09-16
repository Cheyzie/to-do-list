//
//  ToDoList.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 05.08.2022.
//

import SwiftUI

struct ToDoList: View {
    @StateObject private var viewModel = ToDoListViewModel()
    @State private var showCreateForm = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                ListHeader(searchQuery: $viewModel.searchQuery)
                ListGreeter()
                    .environmentObject(viewModel)
                
                RoundedRectangle(cornerRadius: 1)
                    .foregroundColor(.customHaiti)
                    .opacity(0.25)
                    .frame(height: 2)
                    .padding(.horizontal, 16)
                
                ScrollViewReader { list in
                    ScrollView(.vertical, showsIndicators: false) {
                        if showCreateForm {
                            CreateItem { [unowned viewModel] text in
                                viewModel.addToDo(withText: text)
                            }
                                .transition(.move(edge: .trailing))
                        }
                        ForEach(viewModel.filteredToDoItems, id: \.id) { toDo in
                            ToDoItem(toDo: toDo)
                                .environmentObject(viewModel)
                                .frame(height: 50, alignment: .leading)
                                .transition(.move(edge: .trailing))
                        }
                    }
                    .onChange(of: showCreateForm) { value in
                        list.scrollTo(0)
                    }
                }
            }
            .zIndex(0)
            Button {
                showCreateForm.toggle()
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: 56, height: 56, alignment: .center)
                    .foregroundColor(.customHaiti)
                    .rotationEffect(.degrees(showCreateForm ? 45 : 0))
                    .animation(.easeInOut(duration: 0.3), value: showCreateForm)
                    .background {
                        RoundedRectangle(cornerRadius: 28)
                            .shadow(radius: 3)
                            .foregroundColor(.customLightGrey)
                    }
                    
            }
            .padding()
        }
    }
}

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList()
    }
}
