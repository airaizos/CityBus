//
//  CityBusTests.swift
//  CityBusTests
//
//  Created by Adrian Iraizos Mendoza on 24/9/23.
//

import XCTest

@testable import CityBus
final class CityBusTests: XCTestCase {
    var network: Network!
    
    override func setUp() async throws {
        network = Network()
    }
    
    
    override func tearDown() async throws {
        network = nil
    }
    
    func test_FetchJsonBusStop_ShouldReturnLinea33() async throws {
        let busStops =  try await network.fetchJSON(url: URL(string:"https://www.zaragoza.es/sede/servicio/urbanismo-infraestructuras/transporte-urbano/linea-autobus/33.json")!, type: BusStopsModel.self)
        
        XCTAssertEqual(busStops.title, "Transporte Urbano. Línea 33")
    }
    
    func test_FetchJsonBusStopN6_ShouldReturnN6() async throws {
        let busStops =  try await network.fetchJSON(url: URL(string:"https://www.zaragoza.es/sede/servicio/urbanismo-infraestructuras/transporte-urbano/linea-autobus/N6.json")!, type: BusStopsModel.self)
        
        XCTAssertEqual(busStops.title, "Transporte Urbano. Línea N6")
    }
    
    func test_FetchURLLines_ShouldReturn76() async throws {
        let urlBusLines = try await network.fetchJSON(url: .busLines, type: URLBusLines.self)
        
        XCTAssertEqual(urlBusLines.result.count, 76)
    }
    
    func test_FetchAlllines() async throws {
        let urlBusLines = try await network.fetchJSON(url: .busLines, type: URLBusLines.self).result
        
        //titulo:linea
        var busLines: [BusStopsModel] = []
        
        for line in urlBusLines {
            let urlString = line.replace("http", with: "https")
            let url = URL(string: urlString)!.appendingPathExtension("json")
           
            do {
                async let busStop = try network.fetchJSON(url: url, type: BusStopsModel.self)
                
                try await busLines.append(busStop)
            } catch {
                XCTFail("Error")
            }
        }
        
        network.saveJson(data: busLines, type: [BusStopsModel].self, path: URL.documentsDirectory)
        print(URL.documentsDirectory)
        
    }
    
    func test_FetchSearchBusStop_shouldReturn133 () async throws {
        let busStop = try await network.fetchJSON(url: .searchBusStop(id: 133), type: BusStopModel.self)
        
        XCTAssertEqual(busStop.title, "(133) Av. Gómez Laguna N.º 6 Líneas: 22")
        
    }
}
