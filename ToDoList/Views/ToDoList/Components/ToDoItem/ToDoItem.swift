//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 05.08.2022.
//

import SwiftUI

struct ToDoItem: View {
    @EnvironmentObject var viewModel: ToDoListViewModel
    var toDo: Todo
    @State private var offset = CGSize.zero
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Button {
                    viewModel.delete(toDo: toDo)
                } label: {
                    Image(systemName: "trash")
                        .font(.custom("WorkSans-Medium", size: 20))
                        .foregroundColor(.white)
                        .padding(.trailing, 15)
                }
            }
            .background {
                Rectangle()
                    .foregroundColor(.customRed)
                    .frame(height: 50)
            }
            HStack {
                CheckBox(isChecked: toDo.isDone){
                    viewModel.toggle(toDo: toDo)
                }
                    .padding(.leading)
                Text(toDo.text)
                    .font(.custom(
                        toDo.isDone ? "WorkSans-SemiBold" : "WorkSans-Medium",
                        size: 20)
                    )
                    .foregroundColor(toDo.isDone ? .customGreen : .customHaiti)
                    .animation(.easeInOut(duration: 1.5))
                Spacer()            }
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: UIScreen.main.bounds.size.width + 20,height: 50)
                    .foregroundColor(.white)
            }
            .offset(x: offset.width, y: 0)
            .animation(.easeOut(duration: 0.5), value: offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        if gesture.translation.width < 0 {
                            offset = gesture.translation
                        } else {
                            offset = CGSize.zero
                        }
                    }
                    .onEnded { _ in
                        if offset.width > -80 {
                            offset = CGSize.zero
                        } else if offset.width > -UIScreen.main.bounds.size.width/2 {
                            offset.width = -60
                        } else {
                            viewModel.delete(toDo: toDo)
                        }
                    }
            )
        }
    }
}

struct ToDoItem_Previews: PreviewProvider {
    @StateObject static var viewModel = ToDoListViewModel()
    
    static var previews: some View {
        ToDoItem(toDo: viewModel.toDoItems[0])
            .environmentObject(ToDoListViewModel())
    }
}
