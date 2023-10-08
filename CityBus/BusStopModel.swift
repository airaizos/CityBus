//
//  BusStopModel.swift
//  CityBus
//
//  Created by Adrian Iraizos Mendoza on 8/10/23.
//

import Foundation


struct BusStopModel: Codable {
    let id: String
    let title: String
    let lastUpdated: Date
    let destinations: [Destination]
    
    enum CodingKeys: String, CodingKey {
        case id, title, lastUpdated
        case destinations = "destinos"
        
    }
}

struct Destination: Codable {
    let line: String
    let destination: String
    let first: String
    let second: String
    
    enum CodingKeys: String, CodingKey {
        case line = "linea"
        case destination = "destino"
        case first = "primero"
        case second = "segundo"
        
    }
}
