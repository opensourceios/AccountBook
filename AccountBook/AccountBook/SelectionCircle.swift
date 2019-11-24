//
//  SelectionCircle.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/25.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct SelectionCircle: View {
    var color: Color
    @Binding var isSelected: Bool

    var body: some View {
        GeometryReader { geometry in
            Circle()
                .stroke(self.color, lineWidth: geometry.size.width * 0.07)
                .frame(width: geometry.size.width - geometry.size.width * 0.12)
                .position(CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2))

            if self.isSelected {
                Circle()
                    .fill(self.color)
                    .position(CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2))
                    .frame(width: geometry.size.width / 1.4)
                    .transition(.scale)
            }
        }
    }
}

struct SelectionCircle_Previews: PreviewProvider {
    static var previews: some View {
        SelectionCircle(color: .orange, isSelected: .constant(true))
            .previewLayout(.fixed(width: 100, height: 100))
    }
}
