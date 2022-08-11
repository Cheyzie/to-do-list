//
//  Checkmark.swift
//  ToDoList
//
//  Created by Дмитрий Чепов on 08.08.2022.
//

import Foundation
import CoreGraphics
import SwiftUI

struct Checkmark: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        path.move(to: .init(x: 0 * rect.size.width, y: 0.4 * rect.size .height))
        path.addCurve(to: .init(x: 1 * rect.size.width, y: 0 * rect.size.height), controlPoint1: .init(x: 0.28 *  rect.size.width, y: 0.9 * rect.size.height), controlPoint2: .init(x: 0.3 *  rect.size.width, y: 0.9 * rect.size.height))
        return Path(path.cgPath)
    }
}
