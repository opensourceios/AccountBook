//
//  BillColorRow.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/28.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct BillColorRow: View {
    @Binding var bill: Bill
    var billColor: BillColor
    var isSelected: Bool = false

    var body: some View {
        HStack {
            SelectionCircle(color: billColor.value, isSelected: isSelected)
                .frame(width: 24)
            Text(billColor.rawValue)
                .frame(maxWidth: .infinity, alignment: .leading)
        }.onTapGesture {
            self.bill.color = self.billColor
        }
    }
}

struct BillColorRow_Previews: PreviewProvider {
    static var previews: some View {
        BillColorRow(bill: .constant(Bill.defaultBill), billColor: .red)
    }
}
