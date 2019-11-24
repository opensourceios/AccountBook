//
//  DailyList.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/19.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct DailyList: View {
    var body: some View {
        VStack {
            HStack {
                Text("Tuesday, November 19, 2019")
                    .font(.system(size: 12))
                Spacer()
                Text("Income: 2019")
                    .font(.system(size: 12))
                Text("Spending: 2000")
                    .font(.system(size: 12))
            }.padding()

            HStack(spacing: 0.0) {
                List {
                    ForEach([ 1,2,3,4,5 ], id: \.self) { _ in
                        IncomeRow()
                        .listRowInsets(EdgeInsets())
                    }
                }

                List {
                    ForEach([ 1,2,3,4,5 ], id: \.self) { _ in
                        SpendingRow()
                        .listRowInsets(EdgeInsets())
                    }
                }
            }
        }
    }
}

struct DailyList_Previews: PreviewProvider {
    static var previews: some View {
        DailyList()
    }
}
