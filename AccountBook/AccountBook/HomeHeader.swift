//
//  HomeHeader.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/20.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct HomeHeader: View {
    var body: some View {
        HStack(alignment: .center) {
            VStack(spacing: 4) {
                Text("Income")
                Text("2000000.0")
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding([ .leading, .trailing ], 0)

            VStack(spacing: 4) {
                Text("Spending")
                Text("300000.0")
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding([ .leading, .trailing ], 0)
        }
    }
}

struct HomeHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeader()
            .padding([ .leading, .trailing ], 16)
    }
}
