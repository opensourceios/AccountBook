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

    var currentMonthBill: Bill.MonthBill {
        getMonthBill(for: Calendar.currentMonth, on: Calendar.currentYear)
    }

    var currentYearBill: Bill.YearBill {
        getYearBill(for: Calendar.currentYear)
    }

    // MARK: Convenience

    func saveBills() {
        save(data: bills, to: billsData)
    }

    func deleteBill(_ bill: Bill) {
        guard let index = bills.firstIndex(where:  { $0.id == bill.id }) else { return }
        bills.remove(at: index)
        saveBills()
    }

    func editBill(_ bill: Bill) {
        guard let index = bills.firstIndex(where:  { $0.id == bill.id }) else { return }
        bills[index] = bill
        saveBills()
    }

    func getMonthBill(for month: Int, on year: Int) -> Bill.MonthBill {
        let bills = self.bills.filter {
            Calendar.current.component(.month, from: $0.date) == month && Calendar.current.component(.year, from: $0.date) == year
        }
        .sorted { $0.date > $1.date }
        return Bill.MonthBill(month: month, bills: bills)
    }

    func getYearBill(for year: Int) -> Bill.YearBill {
        let monthBills: [Bill.MonthBill] = (1...12).map { getMonthBill(for: $0, on: year) }
        return Bill.YearBill(year: year, monthBills: monthBills)
    }
}

extension UserData {

}

extension Decimal {
    var amountString: String {
        return String(format: "%.02f", Double(truncating: self as NSNumber))
    }
}
