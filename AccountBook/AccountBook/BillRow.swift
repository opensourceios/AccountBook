//
//  BillRow.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/20.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct BillRow: View {
    var body: some View {
        HStack {
            Color.red
                .frame(width: 44)
            Spacer()
            Text("+2000")
        }
    }
}

struct BillRow_Previews: PreviewProvider {
    static var previews: some View {
        BillRow()
    }
}
