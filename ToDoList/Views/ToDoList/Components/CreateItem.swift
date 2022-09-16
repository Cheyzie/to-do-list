//
//  CreateItem.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 09.08.2022.
//

import SwiftUI

struct CreateItem: View {
    @State private var text = ""
    var onCreate: ((String) -> Void)?
    
    var body: some View {
        HStack {
            CheckBox(isChecked: false)
            TextField("Title", text: $text)
                .font(.custom("WorkSans-Medium", size: 20))
                .foregroundColor(.customHaiti)
                .onSubmit {
                    if !text.isEmpty {
                        onCreate?(text)
                        text = ""
                    }
                }
        }
        .padding(.horizontal)
    }
}

struct CreateItem_Previews: PreviewProvider {
    static var previews: some View {
        CreateItem()
    }
}
