//
//  EventRepository.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Foundation

protocol EventRepositoryProtocol {

    func getAllEvents(completion: @escaping (Result<String, Error>) -> Void)
}

struct EventRepository: EventRepositoryProtocol {
    let sportsService: SportsServiceProtocol

    init(sportsService: SportsServiceProtocol) {
        self.sportsService = sportsService
    }

    func getAllEvents(completion: @escaping (Result<String, Error>) -> Void) {
        sportsService.getAllEvents { result in
            print(result)
        }
    }
}
