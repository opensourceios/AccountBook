//
//  IncomeRow.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/19.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct IncomeRow: View {


    var body: some View {
        HStack {
            Spacer()

            Text("Salary")
                .font(.system(size: 14))

            Text("+1000.0")
                .font(.system(size: 17))
                .foregroundColor(.red)
//            .padding()
            .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
        }
    }
}

struct IncomeRow_Previews: PreviewProvider {
    static var previews: some View {
        IncomeRow()
            .previewLayout(.sizeThatFits)
    }
}
