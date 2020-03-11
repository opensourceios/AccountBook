//
//  EditingBill.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/12/1.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct EditingBill: View, BillExaminer {
    @Environment(\.presentationMode) private var presentation
    @EnvironmentObject private var userData: UserData
    @State var bill: Bill
    @State var billName: String?
    @State var billAmount: String?

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Name")) {
                    ASTextField(placeholder: "Name", value: $billName)
                        .font(.system(.subheadline))
                }
                Section(header: Text("Amount")) {
                    AmountTextField(placeholder: "Amount", value: $billAmount)
                        .padding([ .top, .bottom ], 8)
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
            self.bill.name = self.billName ?? ""
            self.bill.amount = self.billAmount?.decimalValue ?? 0
            self.userData.editBill(self.bill)
            self.presentation.wrappedValue.dismiss()
        }) {
            Text("Done")
        }
        .foregroundColor(doneButtonColor)
        .disabled(!isPassed)
    }

    // MARK: Accessors

    private var doneButtonColor: Color {
        if isPassed {
            return .red
        } else {
            return Color(.secondaryLabel)
        }
    }
}

struct EditingBill_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EditingBill(bill: Bill.defaultValue, billAmount: Bill.defaultValue.amount.amountString)
                .environmentObject(UserData())

            EditingBill(bill: Bill.defaultValue, billAmount: Bill.defaultValue.amount.amountString)
                .environmentObject(UserData())
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))

            EditingBill(bill: Bill.defaultValue, billAmount: Bill.defaultValue.amount.amountString)
            .environmentObject(UserData())
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 pro Max"))
        }
    }
}
