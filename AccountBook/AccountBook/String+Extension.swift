//
//  String+Extension.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/12/2.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import Foundation

extension String {
    var decimalValue: Decimal {
        NumberFormatter.amountFormatter.number(from: self)?.decimalValue ?? 0
    }
}
