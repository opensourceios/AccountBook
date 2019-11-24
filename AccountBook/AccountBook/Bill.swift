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

    struct Label : Codable, Hashable {
        var name: String
        var color: Int
        var kind: Kind

        init(kind: Kind, name: String, color: Int) {
            self.kind = kind
            self.name = name
            self.color = color
        }
    }

    var id: String
    var kind: Kind
    var amount: Decimal
    var date: Date
    var labels: [Label]

    init(id: String, kind: Kind, amount: Decimal, date: Date, labels: [Label]) {
        self.id = id
        self.kind = kind
        self.amount = amount
        self.date = date
        self.labels = labels
    }

    static var defaultBill: Bill {
        return Bill(id: UUID().uuidString, kind: .income, amount: 100.00, date: Date(), labels: [ Label(kind: .income, name: "Learning", color: 0x121212) ])
    }
}
