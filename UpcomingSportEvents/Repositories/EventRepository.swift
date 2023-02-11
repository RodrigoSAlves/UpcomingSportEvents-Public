//
//  EventRepository.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Foundation

protocol EventRepositoryProtocol {
    func getEventsBySport(completion: @escaping (Result<[Sport], GetAllEventsError>) -> Void)
}

struct EventRepository: EventRepositoryProtocol {
    let sportsService: SportsServiceProtocol

    init(sportsService: SportsServiceProtocol) {
        self.sportsService = sportsService
    }

    func getEventsBySport(completion: @escaping (Result<[Sport], GetAllEventsError>) -> Void) {
        sportsService.getEventsBySport { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(.networkError(error)))
            }
        }
    }
}
