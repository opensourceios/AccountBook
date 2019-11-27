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
            VStack {
                List {
                    Section(header: Text("Amount")) {
                        TextField("Amount", value: $bill.amount, formatter: currencyFormatter)
                        //                        DecimalField(label: "Amount", value: $billAmount, formatter: currencyFormatter)
                    }
                    .padding(.top, 16)
                    Section(header: Text("Labels")) {
                        Button(action: {
                            self.isShowingAddingLabel.toggle()
                        }) {
                            Text("Add Labels")
                        }
                        .sheet(isPresented: self.$isShowingAddingLabel) {
                            ColorPicker(color: self.$bill.color)
                        }
                    }
                    Section(header: Text("Date")) {
                        DatePicker("", selection: $bill.date, displayedComponents: .date)
                            .transition(.opacity)
                    }
                }
                .listStyle(GroupedListStyle())

                Spacer()
                Button(action: {
                    self.addBill()
                }) {
                    Text("Add")
                }
                .frame(maxWidth: .infinity, maxHeight: 44)
                .background(Color.orange)
                .cornerRadius(8)
            }
            .navigationBarTitle("Add Bill", displayMode: .inline)
        }
    }

    func addBill() {
        bill.kind = kind
        userData.bills.append(bill)
        userData.saveBills()
        presentation.wrappedValue.dismiss()
    }

    // MARK: Components

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

}

struct AddingBill_Previews: PreviewProvider {
    static var previews: some View {
        AddingBill(kind: .income)
            .environmentObject(UserData())
        
    }
}
