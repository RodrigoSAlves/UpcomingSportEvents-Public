//
//  SportData.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Foundation

struct SportData: Codable {
    let id: String
    let name: String
    let events: [EventData]

    enum CodingKeys: String, CodingKey {
        case id = "i"
        case name = "d"
        case events = "e"
    }
}
