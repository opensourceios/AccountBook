//
//  Decimal+Extension.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/28.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import Foundation

extension Decimal {
    func getAmountString(with kind: Bill.Kind) -> String {
        let formatter = NumberFormatter.amountFormatter
        let amountString = formatter.string(from: self as NSNumber) ?? "0.00"
        guard self > 0 else { return amountString }
        switch kind {
        case .income:
            return "+" + amountString
        case .spending:
            return "-" + amountString
        }
    }
}

extension NumberFormatter {
    static var amountFormatter: NumberFormatter {
        let result = NumberFormatter()
        result.minimumFractionDigits = 2
        result.maximumFractionDigits = 2
        return result
    }
}
