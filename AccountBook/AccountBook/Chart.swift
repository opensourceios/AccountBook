//
//  Chart.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/28.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import Foundation
import SwiftUI

struct Chart: Hashable {
    var color: Color
    var startPoint: Double
    var percent: Double

    var startAngle: Double {
        return startPoint * .pi * 2
    }

    var endAngle: Double {
        return (startPoint + percent) * .pi * 2
    }
}
