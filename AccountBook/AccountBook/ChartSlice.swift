//
//  ChartSlice.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/28.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import Foundation
import SwiftUI

struct ChartSlice : Hashable {
    var color: Color
    var startPoint: Double
    var percent: Double

    var startRadians: Double {
        return startPoint * .pi * 2
    }

    var endRadians: Double {
        return (startPoint + percent) * .pi * 2
    }

    static func getChartSlices(for bills: [Bill]) -> [ChartSlice] {
        guard !bills.isEmpty else { return [] }
        var billChart: [BillColor:[Bill]] = [:]
        var totalAmount: Decimal = 0
        bills.forEach {
            totalAmount += $0.amount
            if billChart[$0.color] != nil {
                billChart[$0.color]?.append($0)
            } else {
                billChart[$0.color] = [$0]
            }
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
