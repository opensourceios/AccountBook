//
//  PieChart.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/21.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct PieChart: View {
    var data: [ Chart ]

    var body: some View {
        GeometryReader { geometry in
            ForEach(self.data, id: \.self) { data in
                self.createPath(
                    startAngle: Angle(radians: data.startAngle),
                    endAngle: Angle(radians: data.endAngle),
                    radius: min(geometry.size.width, geometry.size.height) / 2,
                    on: geometry
                )
                    .fill(data.color)
            }
            self.createPath(
                startAngle: Angle(radians: 0),
                endAngle: Angle(radians: .pi * 2),
                radius: min(geometry.size.width, geometry.size.height) / 4,
                on: geometry
            )
                .fill(Color.white)
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

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        let data = [
            Chart(color: .red, startPoint: 0.0, percent: 0.2),
            Chart(color: .orange, startPoint: 0.2, percent: 0.3),
            Chart(color: .purple, startPoint: 0.5, percent: 0.15),
            Chart(color: .blue, startPoint: 0.65, percent: 0.35)
        ]
        return PieChart(data: data)
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
