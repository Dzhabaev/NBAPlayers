//
//  Player.swift
//  NBAPlayers
//
//  Created by Чингиз Джабаев on 06.09.2023.
//

import Foundation

struct Player {
    let firstName: String
    let lastName: String
    
    let position: String
    let teamName: String
    
    let height: String
    
    var fullName: String {
        firstName + " " + lastName
    }
    
    let cityName: String
    let conferenceName: String
}
