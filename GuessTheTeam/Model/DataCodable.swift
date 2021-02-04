//
//  TeamData.swift
//  GuessTheTeam
//
//  Created by Eduardo Oliveira on 03/02/21.
//

import Foundation

struct TeamData: Codable {
    var name: String
    var players: [PlayerData]
}

struct PlayerData: Codable {
    var name: String
    var function: String
    var club: String
    var nationality: String
}
