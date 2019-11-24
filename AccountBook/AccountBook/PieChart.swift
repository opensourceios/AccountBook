//
//  PieChart.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/21.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct PieChart: View {

    var data: [ Double ] = [ 0.2, 0.3, 0.5 ]

    // TODO: Let's make a Model to save every `spending`'s percent and start & end angle
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(self.data, id: \.self) { percent in
                self.createPath(
                    startAngle: Angle(radians: 0),
                    endAngle: Angle(radians: percent * .pi * 2),
                    on: geometry
                )
                .fill(Color.random)
            }
        }
    }

    private func createPath(startAngle: Angle, endAngle: Angle, on geometry: GeometryProxy) -> Path {
        let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
        let diameter = min(geometry.size.width, geometry.size.height)
        return Path { path in
            path.move(to: center)
            path.addArc(
                center: center,
                radius: diameter / 2,
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
        PieChart()
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
