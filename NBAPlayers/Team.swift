//
//  Team.swift
//  NBAPlayers
//
//  Created by Чингиз Джабаев on 07.09.2023.
//

import Foundation

struct Team: Decodable {
    let name: String
    let city: String
    let conference: String
    var fullName: String {
        city + " " + name
    }
}
