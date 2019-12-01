//
//  PieChart.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/21.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct PieChart: View {
    var slices: [ ChartSlice ]

    var body: some View {
        GeometryReader { geometry in
            if self.slices.isEmpty {
                // Placeholder
                Circle()
                    .fill(Color.clear)
                    .opacity(0.35)
            } else {
                // Color Circle
                ForEach(self.slices, id: \.self) { slice in
                    self.createPath(
                        startRadians: slice.startRadians,
                        endRadians: slice.endRadians,
                        radius: min(geometry.size.width, geometry.size.height) / 2,
                        on: geometry
                    )
                        .fill(slice.color)
                }
                // White Separator
                if self.slices.count > 1 {
                    ForEach(self.slices, id: \.self) { slice in
                        self.createPath(
                            startRadians: slice.endRadians - 0.02,
                            endRadians: slice.endRadians,
                            radius: min(geometry.size.width, geometry.size.height) / 2,
                            on: geometry
                        )
                            .fill(Color(.systemBackground))
                    }
                }
                // Middle background Circle
                self.createPath(
                    startRadians: 0,
                    endRadians: .pi * 2,
                    radius: min(geometry.size.width, geometry.size.height) * 0.3,
                    on: geometry
                )
                    .fill(Color(.systemBackground))
            }
        }
    }

    private func createPath(startRadians: Double, endRadians: Double, radius: CGFloat, on geometry: GeometryProxy) -> Path {
        let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
        return Path { path in
            path.move(to: center)
            path.addArc(
                center: center,
                radius: radius,
                startAngle: Angle(radians: startRadians),
                endAngle: Angle(radians: endRadians),
                clockwise: false
            )
            path.closeSubpath()
        }
    }
}

#if DEBUG
struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        return PieChart(slices: ChartSlice.defaultValue)
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
#endif

extension ChartSlice {
    static var defaultValue: [ChartSlice] {
        var startPoint: Double = 0
        let totalCount = Double(BillColor.allCases.count)
        return BillColor.allCases.map { billColor in
            let percent = 1 / totalCount
            defer { startPoint += percent }
            return ChartSlice(color: billColor.value, startPoint: startPoint, percent: percent)
        }
    }
}
