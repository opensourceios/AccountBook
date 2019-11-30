//
//  AddingBill.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/20.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct AddingBill: View {
    @State private var billName: String = ""
    @State private var billAmount: Decimal?
    @State private var billColor: BillColor = .red
    @State private var billDate: Date = Date()
    @State private var isShowingAddingLabel = false
    @Environment(\.presentationMode) private var presentation

    @EnvironmentObject var userData: UserData
    var kind: Bill.Kind

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Name")) {
                    TextField("Name", text: $billName)
                        .font(.system(.subheadline))
                }
                Section(header: Text("Amount")) {
                    TextField("Amount", text: amount)
                        .keyboardType(.numbersAndPunctuation)
                        .font(.system(.largeTitle))
                }
                Section(header: Text("Color")) {
                    ForEach(BillColor.allCases, id: \.self) { billColor in
                        BillColorRow(billColor: billColor, isSelected: self.billColor == billColor)
                    }
                }
                Section(header: Text("Date")) {
                    DatePicker("", selection: $billDate, displayedComponents: .date)
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
        .disabled(billName.isEmpty || billAmount == nil)
    }

    private var amount: Binding<String> {
        Binding<String>(
            get: {
                if let billAmount = self.billAmount {
                    return String(format: "%.02f", Double(truncating: billAmount as NSNumber))
                } else {
                    return ""
                }
        }) {
            if let value = self.amountFormatter.number(from: $0) {
                self.billAmount = value.decimalValue
            } else {
                self.billAmount = 0
            }
        }
    }

    private var amountFormatter: NumberFormatter {
        let result = NumberFormatter()
        result.minimumFractionDigits = 2
        result.maximumFractionDigits = 2
        return result
    }

    // MARK: Interaction

    private func addBill() {
        let bill = Bill(
            id: UUID().uuidString,
            kind: kind,
            name: billName,
            amount: billAmount ?? 0,
            date: billDate,
            color: billColor)
        userData.bills.append(bill)
        userData.saveBills()
        presentation.wrappedValue.dismiss()
    }
}

#if DEBUG
struct AddingBill_Previews: PreviewProvider {
    static var previews: some View {
        AddingBill(kind: .income)
            .environmentObject(UserData())
        
    }
}
#endif

// Will be deleted
struct ListOffsetKey : PreferenceKey {
    static var defaultValue: [CGFloat] = []

    static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
        value.append(contentsOf: nextValue())
    }
}

