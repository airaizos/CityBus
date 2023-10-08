//
//  Interface.swift
//  CityBus
//
//  Created by Adrian Iraizos Mendoza on 24/9/23.
//

import Foundation


extension URL {
    
    static let busLines = URL(string:"https://www.zaragoza.es/sede/servicio/urbanismo-infraestructuras/transporte-urbano/linea-autobus.json")!
    
    static func searchBusStop(id: Int) -> URL  {
        URL(string:"https://www.zaragoza.es/api/recurso/urbanismo-infraestructuras/transporte-urbano/poste/tuzsa-\(id).json")!
    }

}

extension String {
    func replace(_ target: String, with replacement: String) -> String {
        return self.replacingOccurrences(of: target, with: replacement)
    }
}
