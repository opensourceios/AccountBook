//
//  UserData.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/23.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import Combine
import SwiftUI

let billsData = "billsData"
let labelsData = "labelsData"

final class UserData : ObservableObject {
    @Published var bills: [Bill] = load(from: billsData) ?? []

    var income: Decimal {
        bills.filter{ $0.kind == .income }.reduce(0, { $0 + $1.amount })
    }

    var spending: Decimal {
        bills.filter { $0.kind == .spending }.reduce(0, { $0 + $1.amount })
    }

    var currentMonthData: Bill.MonthBill {
        getMonthBill(for: Calendar.currentMonth, on: Calendar.currentYear)
    }

    var currentYearData: Bill.YearBill {
        getYearBill(for: Calendar.currentYear)
    }

    // MARK: Convenience

    func saveBills() {
        save(data: bills, to: billsData)
    }

    func getMonthBill(for month: Int, on year: Int) -> Bill.MonthBill {
        let bills = self.bills.filter {
            Calendar.current.component(.month, from: $0.date) == month && Calendar.current.component(.year, from: $0.date) == year
        }
        return Bill.MonthBill(month: month, bills: bills)
    }

    func getYearBill(for year: Int) -> Bill.YearBill {
        let monthBills: [Bill.MonthBill] = (1..<13).map { getMonthBill(for: $0, on: year) }
        return Bill.YearBill(year: year, months: monthBills)
    }
}

extension UserData {

}
