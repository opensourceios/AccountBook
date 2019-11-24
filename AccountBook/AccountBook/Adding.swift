//
//  Adding.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/20.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct Adding: View {
    @State private var billAmount: Decimal?
    @State private var billLabels: [Bill.Label] = []
    @State private var billDate = Date()
    @State private var isShowingAddingLabel = false

    @EnvironmentObject var userData: UserData
    
    var kind: Bill.Kind
    @Binding var isPresented: Bool

    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Amount")) {
                        TextField("Amount", value: $billAmount, formatter: self.amountFormatter)
                            .font(.system(Font.TextStyle.title))
                            .keyboardType(.decimalPad)
                    }
                    .padding(.top, 16)
                    Section(header: Text("Labels")) {
                        Button(action: {
                            self.isShowingAddingLabel.toggle()
                        }) {
                            Text("Add Labels")
                        }
                        .sheet(isPresented: self.$isShowingAddingLabel) {
                            AddingLabel(isPresented: self.$isShowingAddingLabel)
                        }
                    }
                    Section(header: Text("Date")) {
                        DatePicker("", selection: self.$billDate, displayedComponents: .date)
                            .transition(.opacity)
                    }
                }
                .listStyle(GroupedListStyle())

                Spacer()

                Button(action: {
                    let bill = Bill(
                        id: UUID().uuidString,
                        kind: self.kind,
                        amount: self.billAmount ?? 0,
                        date: self.billDate,
                        labels: []
                    )
                    self.addBill(bill)
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

    func addBill(_ bill: Bill) {
        self.userData.bills.append(bill)
        self.userData.saveBills()
        self.isPresented.toggle()
    }

    // MARK: Components

    private var amountFormatter: NumberFormatter {
        let result = NumberFormatter()
        result.maximumFractionDigits = 2
        return result
    }
}

struct Adding_Previews: PreviewProvider {
    static var previews: some View {
        Adding(kind: .income, isPresented: .constant(true))
            .environmentObject(UserData())
        
    }
}
