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
        return Bill(id: UUID().uuidString, kind: .income, name: "Shopping", amount: 100.00, date: Date(), color: .red)
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

        var chartSlices: [ChartSlice] {
            var billChart: [BillColor:[Bill]] = [:]
            var totalAmount: Decimal = 0
            bills.forEach {
                totalAmount += $0.amount
                billChart[$0.color]?.append($0)
            }
            let result = billChart.sorted { $0.key.sortKey < $1.key.sortKey }
            var startPoint: Double = 0
            return result.map { billChart in
                let billAmount = billChart.value.reduce(0) { $0 + $1.amount }
                let percent = billAmount / totalAmount
                defer { startPoint += Double(truncating: percent as NSNumber) }
                return ChartSlice(color: billChart.key.value, startPoint: startPoint, percent: Double(truncating: percent as NSNumber))
            }
        }
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
        case .purple:
            return 5
        case .gray:
            return 6
        }
    }
}
