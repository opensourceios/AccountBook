//
//  Color+Extension.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/23.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import UIKit
import SwiftUI

enum LabelColor : String, CaseIterable {
    case red = "Red"
    case orange = "Orange"
    case yellow = "Yellow"
    case green = "Green"
    case blue = "Blue"
    case purple = "Purple"
    case gray = "Gray"

    var value: Color {
        switch self {
        case .red:
            return .red
        case .orange:
            return .orange
        case .yellow:
            return .yellow
        case .green:
            return .green
        case .blue:
            return .blue
        case .purple:
            return .purple
        case .gray:
            return .gray
        }
    }
}

extension Color {
    static func color(hexRGB value: Int) -> Color {
        let red = Double((value >> 16) & 0xff) / 255
        let green = Double((value >> 8) & 0xff) / 255
        let blue = Double((value >> 0) & 0xff) / 255
        return Color(red: red, green: green, blue: blue)
    }

    static var random: Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: Int = 255) {
        var red = red, green = green, blue = blue, alpha = alpha
        if red < 0 || red > 255 { red = 0 }
        if green < 0 || green > 255 { green = 0 }
        if blue < 0 || blue > 255 { blue = 0 }
        if alpha < 0 || alpha > 255 { alpha = 0 }
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 255.0)
    }

    convenience init(hexRGB value: UInt) {
        let red = CGFloat((value >> 16) & 0xff) / 255
        let green = CGFloat((value >> 8) & 0xff) / 255
        let blue = CGFloat((value >> 0) & 0xff) / 255
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
