//
//  Game.swift
//  NBAPlayers
//
//  Created by Чингиз Джабаев on 07.09.2023.
//

import Foundation

struct GamesResponse: Decodable {
    let data: [Game]
}

struct Game: Decodable {
    let matchDate: String
    let period: Int
    var season: Int
    let status: String
    let homeTeam: Team
    let homeTeamScore: Int
    let visitorTeam: Team
    let visitorTeamScore: Int
    
    var formattedDate: String {
        DateUtils.formatDate(matchDate)
    }
    var teamVS: String {
        homeTeam.fullName + " vs " + visitorTeam.fullName
    }
    var seasonToString: String {
        String(season)
    }
    var dateSeason: String {
        formattedDate + " / Season: " + seasonToString
    }
    var periodToString: String {
        String(period)
    }
    var homeTeamScoreToString: String {
        String(homeTeamScore)
    }
    var visitorTeamScoreToString: String {
        String(visitorTeamScore)
    }
    
    enum CodingKeys: String, CodingKey {
        case matchDate = "date"
        case period = "period"
        case season = "season"
        case status = "status"
        case homeTeam = "home_team"
        case homeTeamScore = "home_team_score"
        case visitorTeam = "visitor_team"
        case visitorTeamScore = "visitor_team_score"
    }
}
