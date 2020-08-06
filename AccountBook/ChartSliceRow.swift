//
//  ChartSliceRow.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/12/3.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct ChartSliceRow: View {
    var slice: ChartSlice

    var body: some View {
        HStack {
            Circle()
                .fill(slice.color)
                .frame(width: 24, height: 24)
            Text(percentString + "%")
        }
    }

    private var percentString: String {
        String(format: "%.2f", slice.percent * 100)
    }
}

struct ChartSliceRow_Previews: PreviewProvider {
    static var previews: some View {
        ChartSliceRow(slice: ChartSlice(color: .red, startPoint: 0, percent: 1))
    }
}
