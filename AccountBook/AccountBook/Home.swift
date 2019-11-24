//
//  Home.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/19.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct Home: View {

    @EnvironmentObject var userData: UserData

    var body: some View {
        NavigationView {
            VStack {
                HomeHeader()
                List(userData.bills, id: \.self) { bill in
                    Section(header: Text("20-Wednesday")) {
                        BillRow()
                    }
                }
                HomeFooter().environmentObject(userData)
            }
            .navigationBarTitle("2019-10")
            .navigationBarItems(leading: Text("Diagram"), trailing: Text("Settings"))
        }
//        .onAppear {
//            UITableView.appearance().separatorStyle = .none
//        }
//        .onDisappear() {
//            UITableView.appearance().separatorStyle = .singleLine
//        }
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

