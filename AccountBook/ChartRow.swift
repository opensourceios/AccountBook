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
    @Binding var dateStore: DateStore
    @Binding var isPresented: Bool

    var body: some View {
        VStack() {
            HStack {
                Text(yearBill.displayYear)
                .foregroundColor(titleColor)
                    .font(.system(.title))
                    .fontWeight(.bold)
                Spacer()
            }
            Divider()
            ForEach(0..<row, id: \.self) { row in
                self.createRow(row)
            }
        }
    }

    // MARK: Components

    private func createRow(_ row: Int) -> some View {
        HStack(spacing: 16) {
            ForEach(0..<column, id: \.self) { column in
                ChartCell(monthBill: self.getMonthBill(index: row * 3 + column), isCurrentYear: Calendar.currentYear == self.yearBill.year)
                    .onTapGesture {
                        self.dateStore.year = self.yearBill.year
                        self.dateStore.month = self.getMonthBill(index: row * 3 + column).month
                        self.isPresented.toggle()
                }
            }
        }
    }

    private func getMonthBill(index: Int) -> Bill.MonthBill {
        self.yearBill.monthBills[index]
    }

    // MARK: Accessors

    private var titleColor: Color {
        if Calendar.currentYear == yearBill.year {
            return .red
        } else {
            return Color(.label)
        }
    }
}

struct ChartRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChartRow(
                yearBill: .defaultValue(2019),
                dateStore: .constant(.defaultValue),
                isPresented: .constant(false)
            )
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            ChartRow(
                yearBill: .defaultValue(2019),
                dateStore: .constant(.defaultValue),
                isPresented: .constant(false)
            )
                .previewDevice(PreviewDevice(rawValue: "iPhone X"))
        }
    }
}
