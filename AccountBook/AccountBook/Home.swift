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
    @EnvironmentObject var userData: UserData

    var body: some View {
        NavigationView {
            VStack {
                HomeHeader()
                    .padding()
                List {
                    ForEach(userData.bills, id: \.id) { bill in
                        Section(header: Text("20-Wednesday")) {
                            BillRow(bill: bill)
                        }
                    }
                }
                HomeFooter().environmentObject(userData)
            }
            .navigationBarTitle("2019 10 11", displayMode: .inline)
            .navigationBarItems(leading: diagramButton, trailing: settingsButton)
        }
//        .onAppear {
//            UITableView.appearance().separatorStyle = .none
//        }
//        .onDisappear() {
//            UITableView.appearance().separatorStyle = .singleLine
//        }
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
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//            Home()
//            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        }
    }
}

