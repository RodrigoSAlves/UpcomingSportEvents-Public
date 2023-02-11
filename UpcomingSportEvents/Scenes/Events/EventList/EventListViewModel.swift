//
//  EventListViewModel.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 10/02/2023.
//

import Foundation

protocol EventListViewModelDelegate: AnyObject {
    func didFinishLoadingSportsAndEvents()
    func didFailToLoadSportsAndEvents(error: GetEventsBySportError)
}

final class EventListViewModel {
    private let eventRepository: EventRepositoryProtocol

    private(set) var eventsBySport: [EventsBySport] = [EventsBySport]()
    private(set) var getEventsBySportError: GetEventsBySportError?
    private(set) var isLoadingSportingEvents: Bool = false

    weak var delegate: EventListViewModelDelegate?

    init(eventRepository: EventRepositoryProtocol) {
        self.eventRepository = eventRepository
        loadSportingEvents()
    }

    private func loadSportingEvents() {
        guard !isLoadingSportingEvents else {
            return
        }

        isLoadingSportingEvents = true

        eventRepository.getEventsBySport { [weak self] result in
            guard let self else {
                return
            }

            switch result {
            case .success(let eventsBySport):
                self.eventsBySport = eventsBySport
                self.delegate?.didFinishLoadingSportsAndEvents()
            case .failure(let error):
                self.getEventsBySportError = error
                self.delegate?.didFailToLoadSportsAndEvents(error: error)
            }
        }
    }
}
