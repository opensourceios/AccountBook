//
//  Bill.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/23.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import Foundation
import SwiftUI

struct Bill : Codable, Hashable, Identifiable {

    // MARK: Nestd Types
    enum Kind : String, Codable { case income, spending }

    var id: String
    var kind: Kind
    var name: String
    var amount: Decimal
    var date: Date
    var color: BillColor

    static var defaultBill: Bill {
        return Bill(id: UUID().uuidString, kind: .income, name: "Shopping", amount: 100.00, date: Date(), color: .red)
    }
}

enum BillColor : String, Codable, Hashable, CaseIterable {
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
