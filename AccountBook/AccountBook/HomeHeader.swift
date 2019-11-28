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
        HStack() {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Income")
                        .foregroundColor(.gray)
                    Text("200000000")
                        .font(.system(.title))
                }
                Spacer()
            }
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Spending")
                        .foregroundColor(.gray)
                    Text("300000.00")
                        .font(.system(.title))
                }
                Spacer()
            }
        }
    }
}

struct HomeHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeader()
            .padding([ .leading, .trailing ], 16)
    }
}
