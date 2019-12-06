//
//  Data.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/23.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import Foundation

func load<T: Decodable>(from fileName: String) -> T? {
    let file: URL
    let data: Data

    do {
        file = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(fileName)
    } catch {
        fatalError("Couldn't find \(fileName) in Sandbox.")
    }

    guard FileManager.default.fileExists(atPath: file.path) else { return nil }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileName) from Sandbox:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        return nil
//        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
    }
}

func save<T: Encodable>(data: T, to fileName: String) {
    let file: URL
    let _data: Data

    do {
        file = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(fileName)
    } catch {
        fatalError("Couldn't find \(fileName) in Sandbox.")
    }

    do {
        let encoder = JSONEncoder()
        _data = try encoder.encode(data)
    } catch {
        fatalError("Couldn't wrap \(T.self) as \(fileName):\n(error)")
    }

    do {
        try _data.write(to: file)
    } catch {
        fatalError("Couldn't save \(T.self) to \(fileName):\n\(error)")
    }
}

let testBills = [
    Bill(id: "0", kind: .spending, name: "购物", amount: 888, date: Date(), color: .green),
    Bill(id: "1", kind: .spending, name: "午饭", amount: 20, date: Date(), color: .orange),
    Bill(id: "2", kind: .spending, name: "晚饭", amount: 25, date: Date(), color: .orange),
    Bill(id: "3", kind: .spending, name: "看电影", amount: 88, date: Date(), color: .green),

    Bill(id: "4", kind: .spending, name: "买书", amount: 288, date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, color: .green),
    Bill(id: "5", kind: .income, name: "卖掉闲置的iPad", amount: 6000, date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, color: .red),
    Bill(id: "6", kind: .income, name: "工资", amount: 8888, date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, color: .blue),
    Bill(id: "7", kind: .spending, name: "午饭", amount: 20, date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, color: .orange),
    Bill(id: "8", kind: .spending, name: "晚饭", amount: 28, date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, color: .orange),
    Bill(id: "9", kind: .spending, name: "房租", amount: 3000, date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, color: .purple),

] + randomMonthBills + randomYearBills

var randomMonthBills: [Bill] {
    var bills: [Bill] = []
    for i in 1...11 {
        for color in BillColor.allCases {
            switch color {
            case .red, .blue, .orange, .yellow:
                bills.append(Bill(id: "", kind: .income, name: "", amount: Decimal(Int.random(in: 1000...5000)), date: Calendar.current.date(byAdding: .month, value: -i, to: Date())!, color: color))
            case .gray, .purple, .green, .pink:
                bills.append(Bill(id: "", kind: .spending, name: "", amount: Decimal(Int.random(in: 500...1000)), date: Calendar.current.date(byAdding: .month, value: -i, to: Date())!, color: color))
            }
        }
    }
    return bills
}

var randomYearBills: [Bill] {
    var bills: [Bill] = []
    let date = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    for i in 1...11 {
        for color in BillColor.allCases {
            switch color {
            case .red, .blue, .orange, .yellow:
                bills.append(Bill(id: "", kind: .income, name: "", amount: Decimal(Int.random(in: 1000...5000)), date: Calendar.current.date(byAdding: .month, value: -i, to: date)!, color: color))
            case .gray, .purple, .green, .pink:
                bills.append(Bill(id: "", kind: .spending, name: "", amount: Decimal(Int.random(in: 500...1000)), date: Calendar.current.date(byAdding: .month, value: -i, to: date)!, color: color))
            }
        }
    }
    return bills
}
