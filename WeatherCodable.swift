//
//  WeatherCodable.swift
//  Parsing-JSON-Lab
//
//  Created by Brendon Cecilio on 11/26/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    var list: [Weather]
}

struct Weather: Codable {
    var name: String
    var main: [String: Double]
}

extension WeatherData {
    static func getWeather() -> [Weather] {
        var weather = [Weather]()
        
        guard let fileURL = Bundle.main.url(forResource: "Weather", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            weather = weatherData.list
        } catch {
            fatalError("failed to load from contents \(error)")
        }
        
        return weather
    }
}
