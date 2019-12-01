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

    static var defaultValue: Bill {
        Bill(id: UUID().uuidString, kind: .income, name: "Shopping", amount: 100.00, date: Date(), color: .red)
    }

    var displayAmountString: String {
        amount.getAmountString(with: kind)
    }
}

extension Bill {
    struct YearBill : Hashable {
        let year: Int
        let monthBills: [MonthBill]

        static func defaultValue(_ year: Int) -> YearBill {
            let monthBills = (1...12).map { MonthBill.defaultValue($0) }
            return YearBill(year: 2019, monthBills: monthBills)
        }

        var displayYear: String {
            "\(year)"
        }

        var income: Decimal {
            monthBills.reduce(0) { $0 + $1.income }
        }

        var spending: Decimal {
            monthBills.reduce(0) { $0 + $1.spending }
        }

        var hasBills: Bool {
            monthBills.first { !$0.bills.isEmpty } != nil
        }

        var chartSlices: [ChartSlice] {
            ChartSlice.getChartSlices(for: monthBills.flatMap { $0.bills })
        }
    }

    struct MonthBill : Hashable {
        let month: Int
        let bills: [Bill]

        static func defaultValue(_ month: Int) -> MonthBill {
            MonthBill(month: month, bills: Array(repeating: Bill.defaultValue, count: 40))
        }

        var displayMonth: String {
            Calendar.current.shortMonthSymbols[month - 1]
        }

        var income: Decimal {
            bills.reduce(0) { $1.kind == .income ? ($0 + $1.amount) : $0 }
        }

        var spending: Decimal {
            bills.reduce(0) { $1.kind == .spending ? ($0 + $1.amount) : $0 }
        }

        var hsaBills: Bool {
            !bills.isEmpty
        }

        var chartSlices: [ChartSlice] {
            ChartSlice.getChartSlices(for: bills)
        }
    }
}

enum BillColor : String, Codable, Hashable, CaseIterable {
    case red = "Red"
    case orange = "Orange"
    case yellow = "Yellow"
    case green = "Green"
    case blue = "Blue"
    case pink = "Pink"
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
        case .pink:
            return .pink
        case .purple:
            return .purple
        case .gray:
            return .gray
        }
    }

    var sortKey: Int {
        switch self {
        case .red:
            return 0
        case .orange:
            return 1
        case .yellow:
            return 2
        case .green:
            return 3
        case .blue:
            return 4
        case .pink:
            return 5
        case .purple:
            return 6
        case .gray:
            return 7
        }
    }
}
