//
//  Player.swift
//  NBAPlayers
//
//  Created by Чингиз Джабаев on 06.09.2023.
//

import Foundation

struct PlayersResponse: Decodable {
    let data: [Player]
}

struct Player: Decodable {
    let firstName: String
    let lastName: String
    
    let position: String
    let team: Team
    
    let heightFeat: Int?
    let heightInches: Int?
    var height: String {
        if let heightFeat = heightFeat, let heightInches = heightInches {
            return "\(heightFeat)'\(heightInches)''"
        } else {
            return "Unknown"
        }
    }
    var fullName: String {
        firstName + " " + lastName
    }
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case position = "position"
        case team = "team"
        case heightFeat = "height_feet"
        case heightInches = "height_inches"
    }
}

let lakers = Team(name: "Lakers", city: "Los Angeles", conference: "West")
let heat = Team(name: "Heat", city: "Miami", conference: "East")
