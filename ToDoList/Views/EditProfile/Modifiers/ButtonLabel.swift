//
//  Button.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 25.09.2022.
//

import Foundation
import SwiftUI

struct ButtonLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  alignment: .center
            )
            .font(.custom("WorkSans-SemiBold", size: 24))
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
            }
    }
}
