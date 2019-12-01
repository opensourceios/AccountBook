//
//  ChartYearRow.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/12/1.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct ChartYearRow: View {
    var yearBill: Bill.YearBill

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(yearBill.displayYear)
                        .foregroundColor(titleColor)
                        .font(.system(.title))
                        .fontWeight(.bold)
                    Spacer()
                }
                Divider()
                HStack {
                    Text("Income:")
                    Text("+\(yearBill.income.amountString)")
                        .font(.system(.body))
                    Spacer()
                }
                HStack {
                    Text("Spending:")
                    Text("-\(yearBill.spending.amountString)")
                        .font(.system(.body))
                    Spacer()
                }
            }
            PieChart(slices: yearBill.chartSlices)
            .aspectRatio(contentMode: .fit)
        }
    }

    private var titleColor: Color {
        if Calendar.currentYear == yearBill.year {
            return .red
        } else {
            return Color(.label)
        }
    }
}

struct ChartYearRow_Previews: PreviewProvider {
    static var previews: some View {
        ChartYearRow(yearBill: .defaultValue(2019))
    }
}
