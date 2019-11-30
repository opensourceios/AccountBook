//
//  HomeHeader.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/20.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct HomeHeader: View {

    @EnvironmentObject var userData: UserData

    var body: some View {
        HStack() {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Income")
                        .foregroundColor(.gray)
                    Text("\(userData.income.amountString)")
                        .font(.system(.title))
                }
                Spacer()
            }
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Spending")
                        .foregroundColor(.gray)
                    Text("\(userData.spending.amountString)")
                        .font(.system(.title))
                }
                Spacer()
            }
        }
    }
}

#if DEBUG
struct HomeHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeader()
            .environmentObject(UserData())
            .padding([ .leading, .trailing ], 16)
    }
}
#endif
