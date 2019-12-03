//
//  Home.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/19.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State private var isShowingChartView: Bool = false
    @State private var isShowingAbout: Bool = false
    @State private var dateStore = DateStore(year: Calendar.currentYear, month: Calendar.currentMonth)
    @EnvironmentObject private var userData: UserData

    var body: some View {
        NavigationView {
            VStack {
                HomeHeader(amount: amount)
                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 0, trailing: 8))
                List {
                    ForEach(0..<displayBills.count, id: \.self) { section in
                        Section(header: Text(self.displayBills[section].first?.date.displayWeakFormat ?? "")) {
                            ForEach(self.displayBills[section], id: \.id) { bill in
                                BillRow(bill: bill)
                                .environmentObject(self.userData)
                            }
                            .onDelete { indexSet in
                                self.deleteBill(indexSet: indexSet, on: section)
                            }
                        }
                    }
                }
                HomeFooter().environmentObject(userData)
            }
            .navigationBarTitle("\(dateStore.displayString)", displayMode: .inline)
            .navigationBarItems(leading: chartButton, trailing: aboutButton)
        }
    }

    // MARK: Components

    private var chartButton: some View {
        Button(action: {
            self.isShowingChartView.toggle()
        }) {
            Text("Chart")
        }
        .modifier(RedButton())
        .sheet(isPresented: $isShowingChartView) {
            ChartView(dateStore: self.$dateStore, isPresented: self.$isShowingChartView)
                .environmentObject(self.userData)
        }
    }

    private var aboutButton: some View {
        Button(action: {
            self.isShowingAbout.toggle()
        }) {
            Text("About")
        }
        .modifier(RedButton())
        .sheet(isPresented: $isShowingAbout) {
            About()
        }
    }

    // MARK: Interaction

    private func deleteBill(indexSet: IndexSet, on section: Int) {
        guard let index = indexSet.first else { return }
        let bills = displayBills[section]
        let bill = bills[index]
        userData.deleteBill(bill)
    }

    // MARK: Accessors

    private var bills: [Bill] {
        return userData.getMonthBill(for: dateStore.month, on: dateStore.year).bills
    }

    private var displayBills: [[Bill]] {
        var isSameDay: Bool = false
        var result: [[Bill]] = []
        var billsStore: [Bill] = []
        bills.forEach { bill in
            if billsStore.last?.date.isSameDay(with: bill.date) == true {
                isSameDay = true
            } else {
                isSameDay = false
            }
            if !isSameDay && billsStore.last != nil {
                result.append(billsStore)
                billsStore.removeAll()
            }
            billsStore.append(bill)
        }
        if !billsStore.isEmpty {
            result.append(billsStore)
        }
        return result
    }

    private var amount: HomeHeader.Amount {
        var income: Decimal = 0
        var spending: Decimal = 0
        bills.forEach {
            switch $0.kind {
            case .income: income += $0.amount
            case .spending: spending += $0.amount
            }
        }
        return HomeHeader.Amount(income: income, spending: spending)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        return Group {
            Home()
            .environmentObject(UserData())
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            Home()
            .environmentObject(UserData())
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        }
    }
}

struct DateStore {
    var year: Int
    var month: Int

    var displayString: String {
        let compoents = DateComponents(year: year, month: month)
        let date = Calendar.current.date(from: compoents)
        return date?.displayYearFormat ?? ""
    }

    static var defaultValue: DateStore {
        DateStore(year: 2019, month: 9)
    }
}
