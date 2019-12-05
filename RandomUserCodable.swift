//
//  RandomUserCodable.swift
//  Parsing-JSON-Lab
//
//  Created by Brendon Cecilio on 11/27/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import Foundation

struct UserData: Codable {
    var results: [UsersDetail]
}

struct UsersDetail: Codable {
    var name: [String: String]
    var location: Location
}

struct Location: Codable {
    var street: Address
    var city: String
    var state: String
    var country: String
}

struct Address: Codable {
    var number: Int
    var name: String
}

extension UserData {
    static func getLocation() -> [UsersDetail] {
        var location = [UsersDetail]()
        
        guard let fileURL = Bundle.main.url(forResource: "RandomUserGenerator", withExtension: "json") else {
            fatalError("couldnt find json file")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let userData = try JSONDecoder().decode(UserData.self, from: data)
            location = userData.results
        } catch {
            fatalError("failed to load from contents \(error)")
        }
        return location
    }
}
