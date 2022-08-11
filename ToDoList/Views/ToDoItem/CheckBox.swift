//
//  CheckBox.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 08.08.2022.
//

import SwiftUI

struct CheckBox: View {
    var isChecked: Bool
    var onClick: (() -> Void)?
    
    var body: some View {
        Button() {
            onClick?()
        } label: {
            Checkmark()
                .stroke(lineWidth: 1.5)
                .shadow(radius: 1)
                .frame(width: 14, height: 12)
                .padding(.top, 9)
                .padding(.bottom, 6)
                .padding(.leading, 7)
                .padding(.trailing, 6)
                .foregroundColor(.white)
                .opacity(isChecked ? 1 : 0)
                .animation(.easeInOut(duration: 0.5), value: isChecked)
                .background(
                    RoundedRectangle(cornerRadius: isChecked ? 8 : 6)
                        .foregroundColor(isChecked ? Color("Green") :  Color("LightGrey"))
                )
        }
    }
}

struct CheckBox_Previews: PreviewProvider {
    
    static var previews: some View {
        CheckBox(isChecked: false) {print(1)}
    }
}
