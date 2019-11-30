//
//  ChartView.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/28.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct ChartView: View {
    @EnvironmentObject var userData: UserData
    @Environment(\.presentationMode) private var presentation

    var yearBills: [Bill.YearBill] {
        Calendar.years.map {
            userData.getYearBill(for: $0)
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(yearBills, id: \.self) { yearBill in
                        ChartRow(yearBill: yearBill)
                    }
                }
            }
            .navigationBarTitle(Text("Chart"), displayMode: .inline)
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
        .onDisappear {
            UITableView.appearance().separatorStyle = .singleLine
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
            .environmentObject(UserData())
    }
}
