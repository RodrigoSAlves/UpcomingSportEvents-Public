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
    func didUpdateFavoriteStateForEventAt(section: Int, index: Int)
}

final class EventListViewModel {
    private let eventRepository: EventRepositoryProtocol

    private(set) var eventsBySport: [EventsBySport] = [EventsBySport]()
    private(set) var getEventsBySportError: GetEventsBySportError?
    private(set) var isLoadingSportingEvents: Bool = false
    private(set) var sportExpansionStates: [String: Bool] = [:]
    private(set) var favoriteEvents: [String: Bool] = [:]

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
                self.updateExpandedStates()
                self.updateFavoriteEvents()
                self.delegate?.didFinishLoadingSportsAndEvents()
            case .failure(let error):
                self.getEventsBySportError = error
                self.delegate?.didFailToLoadSportsAndEvents(error: error)
            }
        }
    }

    private func updateExpandedStates() {
        var updatedExpansionStates: [String: Bool] = [:]

        eventsBySport.forEach {
            // If we receive new sports, maintain expansion of those who were expanded and exist in new array
            updatedExpansionStates[$0.sport.id] = sportExpansionStates[$0.sport.id] ?? true
        }

        sportExpansionStates = updatedExpansionStates
    }

    private func updateFavoriteEvents() {
        var updatedFavoriteEvents: [String: Bool] = [:]

        eventsBySport.flatMap { $0.events }.forEach {
            updatedFavoriteEvents[$0.id] = favoriteEvents[$0.id] ?? false
        }

        favoriteEvents = updatedFavoriteEvents
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

    func toggleFavoriteForEvent(event: Event) {
        guard let sectionIndex = eventsBySport.firstIndex(where: { $0.sport.id == event.sportId }),
              let eventIndex = eventsBySport[sectionIndex].events.firstIndex(where: { $0.id == event.id }) else {
            return
        }

        if favoriteEvents[event.id] != nil {
            favoriteEvents[event.id] = !favoriteEvents[event.id]!
        } else {
            favoriteEvents[event.id] = true
        }

        eventsBySport[sectionIndex].events.sort {
            let isFirstElementFavorite = favoriteEvents[$0.id] ?? false
            let isSecondElementFavorite = favoriteEvents[$1.id] ?? false

            if isFirstElementFavorite == isSecondElementFavorite {
                return $0.startTime < $1.startTime
            } else {
                return isFirstElementFavorite
            }
        }

        print(eventsBySport[sectionIndex].events)

        delegate?.didUpdateFavoriteStateForEventAt(section: sectionIndex, index: eventIndex)
    }

    func isFavorite(event: Event) -> Bool {
        return favoriteEvents[event.id] ?? false
    }
}
