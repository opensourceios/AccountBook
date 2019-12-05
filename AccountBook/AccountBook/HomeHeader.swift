//
//  HomeHeader.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/20.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct HomeHeader: View {

    var amount: Amount

    var body: some View {
        HStack() {
            HStack {
                VStack(alignment: .center, spacing: 4) {
                    Text("Income")
                        .font(.system(.headline))
                    Text(amount.income.getAmountString(with: .income))
                        .font(.system(.title))
                }
                .frame(maxWidth: .infinity)
            }
            HStack {
                VStack(alignment: .center, spacing: 4) {
                    Text("Spending")
                        .font(.system(.headline))
                    Text(amount.spending.getAmountString(with: .spending))
                        .font(.system(.title))
                }
                .frame(maxWidth: .infinity)
            }
        }
    }

    struct Amount {
        let income: Decimal
        let spending: Decimal

        static var defaultValue: Amount {
            Amount(income: 100, spending: 200)
        }
    }
}

#if DEBUG
struct HomeHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeader(amount: .defaultValue)
            .environmentObject(UserData())
            .padding([ .leading, .trailing ], 16)
    }
}
#endif
