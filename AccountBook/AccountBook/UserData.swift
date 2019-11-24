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
    @Published var labels: [Bill.Label] = load(from: labelsData) ?? []

    var income: Decimal {
        return bills.filter{ $0.kind == .income }.reduce(0, { $0 + $1.amount })
    }

    var spending: Decimal {
        return bills.filter { $0.kind == .spending }.reduce(0, { $0 + $1.amount })
    }

    // MARK: Convenience

    func saveBills() {
        save(data: bills, to: billsData)
    }

    func saveLabels() {
        save(data: labels, to: labelsData)
    }
}

extension UserData {

}
