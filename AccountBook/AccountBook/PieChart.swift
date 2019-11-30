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
            // Color Circle
            ForEach(self.slices.isEmpty ? ChartSlice.defaultValue : self.slices, id: \.self) { data in
                self.createPath(
                    startAngle: Angle(radians: data.startAngle),
                    endAngle: Angle(radians: data.endAngle),
                    radius: min(geometry.size.width, geometry.size.height) / 2,
                    on: geometry
                )
                    .fill(data.color)
            }
            // Middle white Circle
            self.createPath(
                startAngle: Angle(radians: 0),
                endAngle: Angle(radians: .pi * 2),
                radius: min(geometry.size.width, geometry.size.height) / 4,
                on: geometry
            )
                .fill(Color.white)
            // Placeholder
            if self.slices.isEmpty {
                Circle()
                    .fill(Color.black)
                    .opacity(0.35)

                Text("No Bills")
                    .foregroundColor(.white)
                    .font(.system(.subheadline))
                    .position(CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2))
            }
        }
    }

    private func createPath(startAngle: Angle, endAngle: Angle, radius: CGFloat, on geometry: GeometryProxy) -> Path {
        let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
        return Path { path in
            path.move(to: center)
            path.addArc(
                center: center,
                radius: radius,
                startAngle: startAngle,
                endAngle: endAngle,
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
