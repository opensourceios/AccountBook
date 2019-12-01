//
//  Decimal+Extension.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/28.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import Foundation

extension Decimal {
    var currencyString: String {
        let formatter = NumberFormatter.amountFormatter
        formatter.generatesDecimalNumbers = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: self as NSDecimalNumber) ?? "0.00"
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
