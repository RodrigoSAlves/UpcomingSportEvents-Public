//
//  Event.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Foundation

struct Event {
    let id: String
    let name: String
    let sportId: String
    let startTime: Date
    var opponents: [String]

    var firstOpponentName: String? {
        return opponents[safe: 0]
    }

    var secondOpponentName: String? {
        return opponents[safe: 1]
    }

    init (id: String, name: String, sportId: String, startTime: Date) {
        self.id = id
        self.name = name
        self.sportId = sportId
        self.startTime = startTime
        self.opponents = name.components(separatedBy: " - ").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
    }
}
