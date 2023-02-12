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
    func didUpdateFavoriteStatusForEventAt(section: Int, originalIndex: Int, newIndex: Int)
}

final class EventListViewModel {
    private let eventRepository: EventRepositoryProtocol
    private let favoritesRepository: FavoritesRepositoryProtocol

    private(set) var eventsBySport: [EventsBySport] = [EventsBySport]()
    private(set) var getEventsBySportError: GetEventsBySportError?
    private(set) var isLoadingSportingEvents: Bool = false
    private(set) var sportExpansionStates: [String: Bool] = [:]

    weak var delegate: EventListViewModelDelegate?

    init(eventRepository: EventRepositoryProtocol, favoritesRepository: FavoritesRepositoryProtocol) {
        self.eventRepository = eventRepository
        self.favoritesRepository = favoritesRepository
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
              let originalIndex = eventsBySport[sectionIndex].events.firstIndex(where: { $0.id == event.id }) else {
            return
        }

        favoritesRepository.toggleFavoriteStatus(event: event)

        eventsBySport[sectionIndex].events.sort {
            let isFirstElementFavorite = favoritesRepository.getFavoriteStatus(event: $0)
            let isSecondElementFavorite = favoritesRepository.getFavoriteStatus(event: $1)

            if isFirstElementFavorite == isSecondElementFavorite {
                return $0.startTime < $1.startTime
            } else {
                return isFirstElementFavorite
            }
        }

        guard let newIndex = eventsBySport[sectionIndex].events.firstIndex(where: { $0.id == event.id }) else {
            return
        }

        delegate?.didUpdateFavoriteStatusForEventAt(section: sectionIndex, originalIndex: originalIndex, newIndex: newIndex)
    }

    func isFavorite(event: Event) -> Bool {
        return favoritesRepository.getFavoriteStatus(event: event)
    }
}
