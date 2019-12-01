//
//  HomeFooter.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/20.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct HomeFooter: View {
    @State private var showingAdding = false

    @EnvironmentObject var userData: UserData

    var body: some View {
        HStack {
            incomeButton
            .frame(minWidth: 0, maxWidth: .infinity)
            spendingButton
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .frame(height: 44)
//        .padding([ .leading, .trailing ], 16)
    }

    // MARK: Components

    private var incomeButton: some View {
        Button(action: {
            self.showingAdding.toggle()
        }) {
            Text("Income")
        }
        .modifier(RedButton())
        .sheet(isPresented: $showingAdding) {
            AddingBill(kind: .income)
                .environmentObject(self.userData)
        }
    }

    private var spendingButton: some View {
        Button(action: {
            self.showingAdding.toggle()
        }) {
            Text("Spending")
        }
        .modifier(RedButton())
        .sheet(isPresented: $showingAdding) {
            AddingBill(kind: .spending)
                .environmentObject(self.userData)
        }
    }
}

struct HomeFooter_Previews: PreviewProvider {
    static var previews: some View {
        HomeFooter()
    }
}
