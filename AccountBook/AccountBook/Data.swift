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
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
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
