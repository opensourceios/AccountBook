//
//  EditingColorRow.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/12/1.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct EditingColorRow: View {
    @Binding var billColor: BillColor
    
    var body: some View {
        HStack {
            ForEach(BillColor.allCases, id: \.self) { color in
                SelectionCircle(color: color.value, isSelected: self.billColor == color)
                    .onTapGesture {
                        self.billColor = color
                }
            }
        }
    }
}

struct EditingColorRow_Previews: PreviewProvider {
    static var previews: some View {
        EditingColorRow(billColor: .constant(.purple))
    }
}
