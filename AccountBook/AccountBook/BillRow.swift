//
//  BillRow.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/20.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct BillRow: View {

    var bill: Bill

    var body: some View {
        HStack {
            bill.color.value
                .frame(width: 4)
            Text(bill.name)
            Spacer()
            Text(bill.amount.currencyString)
        }
    }
}

struct BillRow_Previews: PreviewProvider {
    static var previews: some View {
        BillRow(bill: Bill.defaultValue)
            .previewLayout(.fixed(width: 300, height: 44))
    }
}
