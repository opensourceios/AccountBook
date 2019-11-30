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
    @State private var dateStore: DateStore = DateStore(year: Calendar.currentYear, month: Calendar.currentMonth)
    @EnvironmentObject var userData: UserData

    var body: some View {
        NavigationView {
            VStack {
                HomeHeader()
                    .environmentObject(userData)
                    .padding()
                List {
                    ForEach(userData.getMonthBill(for: dateStore.month, on: dateStore.year).bills, id: \.id) { bill in
                        Section(header: Text("20-Wednesday")) {
                            BillRow(bill: bill)
                        }
                    }
//                .onDelete(perform: <#T##Optional<(IndexSet) -> Void>##Optional<(IndexSet) -> Void>##(IndexSet) -> Void#>)
                }

                HomeFooter().environmentObject(userData)
            }
            .navigationBarTitle("2019 10 11", displayMode: .inline)
            .navigationBarItems(leading: diagramButton, trailing: settingsButton)
        }
    }

    // MARK: Components

    private var diagramButton: some View {
        Button(action: {
            self.isShowingChartView.toggle()
        }) {
            Text("Chart")
        }
        .sheet(isPresented: $isShowingChartView) {
            ChartView()
                .environmentObject(self.userData)
        }
    }

    private var settingsButton: some View {
        Button(action: {

        }) {
            Text("Settings")
        }
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
}
