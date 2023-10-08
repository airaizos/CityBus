//
//  Network.swift
//  CityBus
//
//  Created by Adrian Iraizos Mendoza on 24/9/23.
//

import Foundation


final class Network {
    
    let decoder = JSONDecoder()
  
    func fetchJSON<JSON:Codable>(url: URL, type: JSON.Type) async throws -> JSON {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let res = response as? HTTPURLResponse else  { throw NSError(domain: "error Response", code: 0)}
        
        decoder.dateDecodingStrategy = .iso8601
        
        switch res.statusCode == 200 {
            
        case true:
            do {
                return try decoder.decode(JSON.self, from: data)
            } catch {
                print("")
            }
        case false: print("ERROR")
        }
        throw NSError(domain: "error Response", code: 0)
    }
    
    func saveJson<JSON:Codable>(data:JSON, type: JSON.Type,path: URL) {
        do {
            let data = try JSONEncoder().encode(data)
            try data.write(to: path, options: .atomic)
        } catch {
            print(">> ERROR saveJson")
        }
    }

}
