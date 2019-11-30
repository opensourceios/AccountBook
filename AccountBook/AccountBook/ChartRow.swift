//
//  ChartRow.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/28.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct ChartRow: View {
    private let row: Int = 4
    private let column: Int = 3

    var yearBill: Bill.YearBill

    var body: some View {
        VStack() {
            HStack {
                Text(yearBill.displayYear)
                    .foregroundColor(Calendar.currentYear == yearBill.year ? .red : .black)
                    .font(.system(.title))
                    .fontWeight(.bold)
                Spacer()
            }
            Divider()
            ForEach(0..<row, id: \.self) { row in
                self.createRow(row)
            }
        }
        .padding()
    }

    // MARK: Components

    private func createRow(_ row: Int) -> some View {
        HStack(spacing: 16) {
            ForEach(0..<column, id: \.self) { column in
                ChartCell(monthBill: self.yearBill.monthBills[row * 3 + column], isCurrentYear: Calendar.currentYear == self.yearBill.year)
            }
        }
    }
}

struct ChartRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChartRow(yearBill: Bill.YearBill.defaultValue(2019))
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            ChartRow(yearBill: Bill.YearBill.defaultValue(2019))
                .previewDevice(PreviewDevice(rawValue: "iPhone X"))
        }
    }
}

struct CalendarData {

}
