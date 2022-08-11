//
//  ListHeader.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 08.08.2022.
//

import SwiftUI

struct ListHeader: View {
    var body: some View {
        HStack {
            Text("Inbox")
                .font(.custom("WorkSans-Bold", size: 24))
                .foregroundColor(Color("Haiti"))
            Spacer()
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color("Haiti"))
        }
        .font(.custom("WorkSans-Bold", size: 24))
        .padding(16)
    }
}

struct ListHeader_Previews: PreviewProvider {
    static var previews: some View {
        ListHeader()
    }
}
