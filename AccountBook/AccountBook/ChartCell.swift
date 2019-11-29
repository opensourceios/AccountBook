//
//  ChartCell.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/29.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct ChartCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Feb")
                .font(.system(.headline))
            PieChart(data: [ Chart(color: .red, startPoint: 0.0, percent: 1.0) ])
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct ChartCell_Previews: PreviewProvider {
    static var previews: some View {
        ChartCell()
//            .previewLayout(.fixed(width: 200, height: 220))
    }
}
