//
//  ChartView.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/28.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct ChartView: View {
    @EnvironmentObject private var userData: UserData
    @State private var kind: Kind = .month

    @Binding var dateStore: DateStore
    @Binding var isPresented: Bool

    var body: some View {
        NavigationView {
            VStack {
                HomeHeader(amount: amount)
                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 0, trailing: 8))
                Picker(selection: $kind, label: Text("")) {
                    ForEach(Kind.allCases, id: \.self) { kind in
                        Text(kind.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                if kind == .month {
                    List {
                        ForEach(yearBills, id: \.self) { yearBill in
                            ChartRow(
                                yearBill: yearBill,
                                dateStore: self.$dateStore,
                                isPresented: self.$isPresented
                            )
                        }
                    }
                } else {
                    List {
                        ForEach(yearBills, id: \.self) { yearBill in
                            ChartYearRow(yearBill: yearBill)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Chart"), displayMode: .inline)
            .navigationBarItems(leading: closeButton)
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
        .onDisappear {
            UITableView.appearance().separatorStyle = .singleLine
        }
    }

    // MARK: Components

    private var closeButton: some View {
        Button(action: {
            self.isPresented.toggle()
        }) {
            Text("Close")
        }
        .modifier(RedButton())
    }

    // MARK: Accessors

    var yearBills: [Bill.YearBill] {
        Calendar.years.map {
            userData.getYearBill(for: $0)
        }
        .filter { $0.hasBills }
    }

    private var amount: HomeHeader.Amount {
        HomeHeader.Amount(income: userData.income, spending: userData.spending)
    }
}

#if DEBUG
struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(dateStore: .constant(.defaultValue), isPresented: .constant(false))
            .environmentObject(UserData())
    }
}
#endif

extension ChartView {
    enum Kind : String, CaseIterable {
        case month = "Month"
        case year = "Year"
    }
}
