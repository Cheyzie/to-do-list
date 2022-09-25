//
//  ListGreeter.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 08.08.2022.
//

import SwiftUI

struct ListGreeter: View {
    @StateObject var viewModel = ListGreeterViewModel()
    
    var body: some View {
        VStack {
            Image("avatar")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            
            HStack {
                Text("Hey, \(viewModel.user?.displayName ?? "you")!")
                    .font(.custom("WorkSans-SemiBold", size: 24))
                    .foregroundColor(.customHaiti)
            }
        }
    }
}

struct ListGreeter_Previews: PreviewProvider {
    static var previews: some View {
        ListGreeter()
    }
}
