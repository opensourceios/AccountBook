//
//  AddingBill.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/20.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct AddingBill: View, BillExaminer {
    @State var billName: String? = nil
    @State var billAmount: String? = nil
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
                    ASTextField(placeholder: "Name", value: $billName)
                        .font(.system(.subheadline))
                }
                Section(header: Text("Amount")) {
                    AmountTextField(placeholder: "Amount", value: $billAmount)
                        .padding([ .top, .bottom ], 8)
                }
                Section(header: Text("Color")) {
                    ForEach(BillColor.allCases, id: \.self) { billColor in
                        BillColorRow(billColor: billColor, isSelected: self.billColor == billColor)
                            .onTapGesture {
                                self.billColor = billColor
                        }
                    }
                }
                Section(header: Text("Date")) {
                    DatePicker("", selection: $billDate, in: Calendar.dateClosedRange, displayedComponents: .date)
                        .transition(.opacity)
                        .labelsHidden()
                }
            }
            .modifier(AdaptsToKeyboard())
            .listStyle(GroupedListStyle())
            .navigationBarTitle(title, displayMode: .inline)
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
            self.addBill()
            self.presentation.wrappedValue.dismiss()
        }) {
            Text("Done")
        }
        .foregroundColor(doneButtonColor)
        .disabled(!isPassed)
    }

    // MARK: Interaction

    private func addBill() {
        let bill = Bill(
            id: UUID().uuidString,
            kind: kind,
            name: billName ?? "",
            amount: billAmount?.decimalValue ?? 0,
            date: billDate,
            color: billColor)
        userData.bills.append(bill)
        userData.saveBills()
        presentation.wrappedValue.dismiss()
    }

    // MARK: Accessors

    private var doneButtonColor: Color {
        if isPassed {
            return .red
        } else {
            return Color(.secondaryLabel)
        }
    }

    private var title: LocalizedStringKey {
        switch kind {
        case.income:
            return "Add Income"
        case .spending:
            return "Add Spending"
        }
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
