//
//  EditingBill.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/12/1.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct EditingBill: View {

    @Environment(\.presentationMode) private var presentation
    @EnvironmentObject private var userData: UserData
    @State var bill: Bill

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Name")) {
                    TextField("Name", text: $bill.name)
                        .font(.system(.subheadline))
                }
                Section(header: Text("Amount")) {
                    TextField("Amount", text: amount)
                        .keyboardType(.numbersAndPunctuation)
                        .font(.system(.largeTitle))
                }
                Section(header: Text("Color")) {
                    EditingColorRow(billColor: self.$bill.color)
                        .frame(height: 60)
                }
                Section(header: Text("Date")) {
                    DatePicker("Date", selection: $bill.date, in: Calendar.dateClosedRange, displayedComponents: .date)
                    .transition(.opacity)
                    .labelsHidden()
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Edit Bill", displayMode: .inline)
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
        .modifier(RedButton())
    }

    private var doneButton: some View {
        Button(action: {
            self.userData.editBill(self.bill)
            self.presentation.wrappedValue.dismiss()
        }) {
            Text("Done")
        }
        .foregroundColor(doneButtonColor)
        .disabled(!canDone)
    }

    // MARK: Accessors

    private var amount: Binding<String> {
        Binding<String>(
            get: {
                return String(format: "%.02f", Double(truncating: self.bill.amount as NSNumber))
        }) {
            if let value = NumberFormatter.amountFormatter.number(from: $0) {
                self.bill.amount = value.decimalValue
            } else {
                self.bill.amount = 0
            }
        }
    }

    private var canDone: Bool {
        !bill.name.isEmpty && bill.amount != 0
    }

    private var doneButtonColor: Color {
        if canDone {
            return .red
        } else {
            return Color(.secondaryLabel)
        }
    }
}

#if DEBUG
struct EditingBill_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EditingBill(bill: Bill.defaultValue)
                .environmentObject(UserData())

            EditingBill(bill: Bill.defaultValue)
                .environmentObject(UserData())
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))

            EditingBill(bill: Bill.defaultValue)
            .environmentObject(UserData())
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 pro Max"))
        }
    }
}
#endif
