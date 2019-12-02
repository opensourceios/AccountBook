//
//  BillExaminer.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/12/3.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import Foundation

protocol BillExaminer {
    var billName: String? { get set }
    var billAmount: String? { get set }

    var isPassed: Bool { get }
}

extension BillExaminer {
    var isPassed: Bool {
        guard let billName = billName, !billName.isEmpty else { return false }
        guard let billAmount = billAmount, !billAmount.isEmpty else { return false }
        return true
    }
}
