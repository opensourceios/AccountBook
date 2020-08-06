//
//  Date+Extension.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/23.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import Foundation

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

    static var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -70, to: Date())!
        let max = Calendar.current.date(byAdding: .month, value: 1, to: Date())!
        return min...max
    }
}

extension Date {
    var displayWeakFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d EEE"
        return formatter.string(from: self)
    }

    var displayYearFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy"
        return formatter.string(from: self)
    }

    static var currentTimeInterval: TimeInterval {
        return Date().timeIntervalSince1970
    }

    func isSameDay(with date: Date) -> Bool {
        return Calendar.current.isDate(self, inSameDayAs: date)
    }

    func compare(with date: Date) -> Int {
        return Calendar.current.compare(date, to: self, toGranularity: .day).rawValue
    }

    func add(component: Calendar.Component, value: Int) -> Date? {
        return Calendar.current.date(byAdding: component, value: value, to: self)
    }
}
