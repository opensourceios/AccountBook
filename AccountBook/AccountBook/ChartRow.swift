//
//  ChartRow.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/28.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct ChartRow: View {

    var year: Int

    var body: some View {
        VStack() {
            HStack {
                Text("2019")
                .font(.system(.title))
                .fontWeight(.bold)
                Spacer()
            }
            Divider()
            ForEach(0..<4, id: \.self) { index in
                self.createRow(with: index)
            }
        }
        .padding()
    }

    // MARK: Components

    private func createRow(with index: Int) -> some View {
        return HStack {
            ForEach(0..<3, id: \.self) { i in
                ChartCell()
            }
        }
    }
}

struct ChartRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChartRow(year: 2019)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            ChartRow(year: 2019)
                .previewDevice(PreviewDevice(rawValue: "iPhone X"))
        }
    }
}

extension Calendar {
    static var currentMonth: Int {
        return Calendar.current.component(.month, from: Date())
    }

    static var currentYear: Int {
        return Calendar.current.component(.year, from: Date())
    }

    static var years: [Int] {
        let beginYear = Calendar.current.component(.year, from: Date.init(timeIntervalSince1970: 0))
        return (beginYear...currentYear).reversed().map { $0 }
    }
}

struct CalendarData {

}
