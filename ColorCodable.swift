//
//  ColorCodable.swift
//  Parsing-JSON-Lab
//
//  Created by Brendon Cecilio on 11/26/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import Foundation

struct ColorData: Codable {
    let results: [Colors]
}

struct Colors: Codable {
    var name: ColorName
    var rgb: RGB
}

struct ColorName: Codable {
    var value: String
}

struct RGB: Codable {
    var r: Double
    var g: Double
    var b: Double
}

extension ColorData {
    static func getColors() -> [Colors] {
        var colors = [Colors]()
        
        guard let fileURL = Bundle.main.url(forResource: "Color", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let colorData = try JSONDecoder().decode(ColorData.self, from: data)
            colors = colorData.results
        } catch {
            fatalError("failed to load from contents \(error)")
        }
        
        return colors
    }
}
