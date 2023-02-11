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
    func didToggleExpansionForSection(section: Int, isExpanded: Bool)
}

final class EventListViewModel {
    private let eventRepository: EventRepositoryProtocol

    private(set) var eventsBySport: [EventsBySport] = [EventsBySport]()
    private(set) var getEventsBySportError: GetEventsBySportError?
    private(set) var isLoadingSportingEvents: Bool = false
    private(set) var sportExpansionStates: [String: Bool] = [:]

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

            self.isLoadingSportingEvents = false

            switch result {
            case .success(let eventsBySport):
                self.eventsBySport = eventsBySport

                self.sportExpansionStates.removeAll()
                self.eventsBySport.forEach { self.sportExpansionStates[$0.sport.id] = true }

                self.delegate?.didFinishLoadingSportsAndEvents()
            case .failure(let error):
                self.getEventsBySportError = error
                self.delegate?.didFailToLoadSportsAndEvents(error: error)
            }
        }
    }

    func toggleSportExpansion(sport: Sport) {
        guard let sectionIndex = eventsBySport.firstIndex(where: { $0.sport.id == sport.id }),
              sportExpansionStates[sport.id] != nil else {
            return
        }

        let newExpandedValue = !sportExpansionStates[sport.id]!
        sportExpansionStates[sport.id] = newExpandedValue
        delegate?.didToggleExpansionForSection(section: sectionIndex, isExpanded: newExpandedValue)
    }

    func isExpanded(sport: Sport) -> Bool {
        return sportExpansionStates[sport.id] ?? false
    }
}
