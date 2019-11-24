//
//  SpendingRow.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/19.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct SpendingRow: View {
    var body: some View {
        HStack {
            Text("-888.0")
                .font(.system(size: 17))
                .foregroundColor(.green)
//                .padding()
                .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))

            Text("Shopping")
                .font(.system(size: 14))

            Spacer()
        }
    }
}

struct SpendingRow_Previews: PreviewProvider {
    static var previews: some View {
        SpendingRow()
            .previewLayout(.sizeThatFits)
    }
}
