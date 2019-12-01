//
//  ChartCell.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/29.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct ChartCell: View {
    var monthBill: Bill.MonthBill
    var isCurrentYear: Bool = false

    var body: some View {
        ZStack {
            PieChart(slices: monthBill.chartSlices)
                .aspectRatio(contentMode: .fit)
            Text(monthBill.displayMonth)
                .foregroundColor(titleColor)
                .font(titleFont)
        }
    }

    // MARK: Accessor

    private var titleColor: Color {
        if Calendar.currentMonth == monthBill.month && isCurrentYear {
            return .red
        } else {
            return Color(.label)
        }
    }

    private var titleFont: Font {
        if monthBill.bills.isEmpty {
            return .system(size: 20, weight: .semibold)
        } else {
            return .system(.headline)
        }
    }
}

struct ChartCell_Previews: PreviewProvider {
    static var previews: some View {
        ChartCell(monthBill: Bill.MonthBill.defaultValue(9), isCurrentYear: true)
            .previewLayout(.fixed(width: 200, height: 220))
    }
}
