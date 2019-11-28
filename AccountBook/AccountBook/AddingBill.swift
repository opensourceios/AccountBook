//
//  AddingBill.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/20.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct AddingBill: View {
    @State private var bill = Bill.defaultBill
    @State private var isShowingAddingLabel = false
    @Environment(\.presentationMode) private var presentation

    @EnvironmentObject var userData: UserData
    var kind: Bill.Kind

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Amount")) {
                    TextField("Amount", value: $bill.amount, formatter: currencyFormatter)
                    //                        DecimalField(label: "Amount", value: $billAmount, formatter: currencyFormatter)
                }
                .padding(.top, 16)
                Section(header: Text("Color")) {
                    ForEach(BillColor.allCases, id: \.self) { billColor in
                        BillColorRow(bill: self.$bill, billColor: billColor, isSelected: self.bill.color == billColor)
                    }
                }
                Section(header: Text("Date")) {
                    DatePicker("", selection: $bill.date, displayedComponents: .date)
                        .transition(.opacity)
                        .labelsHidden()
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Add Bill", displayMode: .inline)
            .navigationBarItems(leading: cancelButton, trailing: doneButton)
        }
    }

    // MARK: Components

    private var cancelButton: some View {
        Button(action: {
            self.presentation.wrappedValue.dismiss()
        }) {
            Text("Cancel")
        }
    }

    private var doneButton: some View {
        Button(action: {
            self.addBill()
            self.presentation.wrappedValue.dismiss()
        }) {
            Text("Done")
        }
    }

    private var currencyFormatter: NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.isLenient = true
        return nf
    }

    private var amountFormatter: NumberFormatter {
        let result = NumberFormatter()
        result.maximumFractionDigits = 2
        return result
    }

    // MARK: Interaction

    private func addBill() {
        bill.kind = kind
        userData.bills.append(bill)
        userData.saveBills()
        presentation.wrappedValue.dismiss()
    }
}

struct AddingBill_Previews: PreviewProvider {
    static var previews: some View {
        AddingBill(kind: .income)
            .environmentObject(UserData())
        
    }
}
