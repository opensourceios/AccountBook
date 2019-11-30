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
        VStack(alignment: .leading, spacing: 0) {
            Text(monthBill.displayMonth)
                .foregroundColor(Calendar.currentMonth == monthBill.month && isCurrentYear ? .red : .black)
                .font(.system(.headline))
            PieChart(slices: monthBill.chartSlices)
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct ChartCell_Previews: PreviewProvider {
    static var previews: some View {
        ChartCell(monthBill: Bill.MonthBill.defaultValue(9), isCurrentYear: true)
            .previewLayout(.fixed(width: 200, height: 220))
    }
}
