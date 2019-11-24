//
//  Date+Extension.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/23.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import Foundation

extension Date {

    var displayDayFormat: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "d"
        return formatter.string(from: self)
    }

    var displayWeekFormat: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "d"
        return formatter.string(from: self)
    }

    var displayMonthFormat: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "MMMM d EEE"
        return formatter.string(from: self)
    }

    var displayYearFormat: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
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
