//
//  EventRepository.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Foundation

protocol EventRepositoryProtocol {
}

struct EventRepository: EventRepositoryProtocol {

    let sportsService: SportsServiceProtocol

    init(sportsService: SportsServiceProtocol) {
        self.sportsService = sportsService
    }
}
