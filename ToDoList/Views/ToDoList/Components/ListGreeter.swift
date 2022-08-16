//
//  ListGreeter.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 08.08.2022.
//

import SwiftUI

struct ListGreeter: View {
    @EnvironmentObject var viewModel: ToDoListViewModel
    var body: some View {
        VStack {
            Image("avatar")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            Text("Hey, Cheyzie!")
                .font(.custom("WorkSans-SemiBold", size: 24))
                .foregroundColor(Color("Haiti"))
            Text("\(viewModel.uncompletedTasks) Task\(viewModel.uncompletedTasks == 1 ? "" : "s")")
                .font(.custom("WorkSans-Medium", size: 16))
                .foregroundColor(Color("Shadow"))
                .padding(.top, 1)
        }
    }
}

struct ListGreeter_Previews: PreviewProvider {
    static var previews: some View {
        ListGreeter()
            .environmentObject(ToDoListViewModel())
    }
}
