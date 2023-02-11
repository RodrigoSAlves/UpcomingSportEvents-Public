//
//  EventListViewModel.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 10/02/2023.
//

import Foundation

final class EventListViewModel {

    let eventRepository: EventRepositoryProtocol

    init(eventRepository: EventRepositoryProtocol) {
        self.eventRepository = eventRepository
        eventRepository.getAllEvents { result in
            print(result)
        }
    }
}
