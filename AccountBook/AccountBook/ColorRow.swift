//
//  ColorRow.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/25.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct ColorRow: View {
    @EnvironmentObject var item: ColorItem

    var body: some View {
        HStack {
            SelectionCircle(color: self.item.color, isSelected: self.$item.isSelected)
            .frame(width: 24)
            Text(self.item.id)
        }
    }
}

struct ColorRow_Previews: PreviewProvider {
    static var previews: some View {
        ColorRow()
            .environmentObject(ColorItem(labelColor: .red))
    }
}

class ColorItem : ObservableObject, Identifiable {
    var labelColor: LabelColor
    @Published var isSelected: Bool = false

    init(labelColor: LabelColor) {
        self.labelColor = labelColor
    }

    // MARK: Accessors
    var id: String { return labelColor.rawValue }
    var color: Color { return labelColor.value }
}
