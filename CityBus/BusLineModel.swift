//
//  BusLineModel.swift
//  CityBus
//
//  Created by Adrian Iraizos Mendoza on 24/9/23.
//

import Foundation


struct BusStopsModel: Codable {
    let totalCount, start, rows: Int
    let lastUpdated, link, icon, description: String
    let title: String
    let result: [Result]
}

// MARK: - Result
struct Result: Codable {
    let geometry: Geometry
    let link: String?
    let about: String?
    let title, description: String?
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: TypeEnum
    let coordinates: [Coordinate]
}

enum Coordinate: Codable {
    case double(Double)
    case doubleArrayArray([[Double]])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([[Double]].self) {
            self = .doubleArrayArray(x)
            return
        }
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        throw DecodingError.typeMismatch(Coordinate.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Coordinate"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .doubleArrayArray(let x):
            try container.encode(x)
        }
    }
}

enum TypeEnum: String, Codable {
    case multiLineString = "MultiLineString"
    case point = "Point"
}
