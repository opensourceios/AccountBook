//
//  BillRow.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/20.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct BillRow : View {
    @State private var isShowingEditingBill: Bool = false
    @EnvironmentObject private var userData: UserData

    var bill: Bill

    var body: some View {
        HStack {
            bill.color.value
                .frame(width: 2, height: 44)
            Text(bill.name)
            Spacer()
            Text(bill.displayAmountString)
        }
        .onLongPressGesture {
            let feedback = UIImpactFeedbackGenerator(style: .light)
            feedback.prepare()
            feedback.impactOccurred()
            self.isShowingEditingBill.toggle()
        }
        .sheet(isPresented: $isShowingEditingBill) {
            EditingBill(bill: self.bill, billAmount: self.bill.amount.amountString)
                .environmentObject(self.userData)
        }
    }
}

struct BillRow_Previews: PreviewProvider {
    static var previews: some View {
        BillRow(bill: Bill.defaultValue)
        .environmentObject(UserData())
            .previewLayout(.fixed(width: 300, height: 44))
    }
}
