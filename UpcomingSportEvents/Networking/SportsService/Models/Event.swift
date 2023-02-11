//
//  Event.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Foundation

struct Event: Codable {
    let id: String
    let name: String
    let sportId: String
    let startTime: Int

    enum CodingKeys: String, CodingKey {
        case id = "i"
        case name = "d"
        case sportId = "si"
        case startTime = "tt"
    }
}
