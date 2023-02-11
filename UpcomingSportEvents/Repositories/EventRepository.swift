//
//  EventRepository.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Foundation

protocol EventRepositoryProtocol {
    func getEventsBySport(completion: @escaping (Result<[EventsBySport], GetEventsBySportError>) -> Void)
}

struct EventRepository: EventRepositoryProtocol {
    let sportsService: SportsServiceProtocol

    init(sportsService: SportsServiceProtocol) {
        self.sportsService = sportsService
    }

    func getEventsBySport(completion: @escaping (Result<[EventsBySport], GetEventsBySportError>) -> Void) {
        sportsService.getAllSportsEagerLoadedWithEvents { result in
            switch result {
            case .success(let sportDataArray):
                var eventsBySport: [EventsBySport] = [EventsBySport]()

                sportDataArray.forEach { sportData in
                    let sport = Sport(id: sportData.id, name: sportData.name)
                    var events: [Event] = [Event]()

                    sportData.events.forEach { eventData in
                        let event = Event(
                            id: eventData.id,
                            name: eventData.name,
                            sportId: eventData.sportId,
                            startTime: eventData.startTime
                        )

                        events.append(event)
                    }

                    eventsBySport.append(EventsBySport(sport: sport, events: events))
                }

                completion(.success(eventsBySport))
            case .failure(let error):
                completion(.failure(.networkError(error)))
            }
        }
    }
}
