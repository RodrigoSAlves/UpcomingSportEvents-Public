//
//  EventListViewModel.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 10/02/2023.
//

import Foundation

protocol EventListViewModelDelegate: AnyObject {
    func didUpdateIsLoadingSportingEvents(isLoadingSportingEvents: Bool)
    func didFinishLoadingSportsAndEvents()
    func didUpdateGetEventsBySportError(error: GetEventsBySportError?)
    func didToggleExpansionForSection(section: Int, isExpanded: Bool)
    func didUpdateFavoriteStatusForEventAt(section: Int, originalIndex: Int, newIndex: Int)
}

final class EventListViewModel {
    private let eventRepository: EventRepositoryProtocol
    private let favoritesRepository: FavoritesRepositoryProtocol

    private(set) var eventsBySport: [EventsBySport] = [EventsBySport]()
    private(set) var getEventsBySportError: GetEventsBySportError?
    private(set) var isLoadingSportingEvents: Bool = false
    private(set) var sportsSectionsExpansionStatuses: [String: Bool] = [:]

    weak var delegate: EventListViewModelDelegate?

    init(eventRepository: EventRepositoryProtocol, favoritesRepository: FavoritesRepositoryProtocol) {
        self.eventRepository = eventRepository
        self.favoritesRepository = favoritesRepository
    }

    func viewWillAppear() {
        loadSportingEvents()
    }

    private func loadSportingEvents() {
        guard !isLoadingSportingEvents else {
            return
        }

        getEventsBySportError = nil
        delegate?.didUpdateGetEventsBySportError(error: nil)

        isLoadingSportingEvents = true
        delegate?.didUpdateIsLoadingSportingEvents(isLoadingSportingEvents: isLoadingSportingEvents)

        eventRepository.getEventsBySport { [weak self] result in
            guard let self else {
                return
            }

            self.isLoadingSportingEvents = false
            self.delegate?.didUpdateIsLoadingSportingEvents(isLoadingSportingEvents: self.isLoadingSportingEvents)

            switch result {
            case .success(let eventsBySport):
                self.eventsBySport = eventsBySport
                self.delegate?.didFinishLoadingSportsAndEvents()
            case .failure(let error):
                self.getEventsBySportError = error
                self.delegate?.didUpdateGetEventsBySportError(error: error)
            }
        }
    }

    func getSportSectionIdentifier(sport: Sport) -> String {
        return sport.id
    }

    func getSportSectionExpansionState(sport: Sport) -> Bool {
        let sectionIdentifier = getSportSectionIdentifier(sport: sport)
        return sportsSectionsExpansionStatuses[sectionIdentifier] ?? true
    }

    func setSportSectionIsExpanded(sport: Sport, isExpanded: Bool) {
        let sectionIdentifier = getSportSectionIdentifier(sport: sport)
        sportsSectionsExpansionStatuses[sectionIdentifier] = isExpanded
    }

    func toggleSportSectionExpansion(sectionIdentifier: String) {
        guard let sectionIndex = eventsBySport.firstIndex(where: { getSportSectionIdentifier(sport: $0.sport) == sectionIdentifier }) else {
            return
        }

        let sport = eventsBySport[sectionIndex].sport
        let newIsExpandedValue = !getSportSectionExpansionState(sport: sport)
        setSportSectionIsExpanded(sport: sport, isExpanded: newIsExpandedValue)

        delegate?.didToggleExpansionForSection(section: sectionIndex, isExpanded: newIsExpandedValue)
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

    func didTapRetryButton() {
        loadSportingEvents()
    }
}
