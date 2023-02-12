//
//  FavoritesRepository.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 12/02/2023.
//

import Foundation

struct FavoritesRepository: FavoritesRepositoryProtocol {

    let favoritesStorage: FavoritesStorageProtocol

    init(favoritesStorage: FavoritesStorageProtocol) {
        self.favoritesStorage = favoritesStorage
    }

    private func getEventFavoritesStorageIdentifier(for event: Event) -> String {
        return "event-\(event.id)"
    }

    func getFavoriteStatus(event: Event) -> Bool {
        let identifier = getEventFavoritesStorageIdentifier(for: event)
        return favoritesStorage.getFavoriteStatus(identifier: identifier)
    }

    func toggleFavoriteStatus(event: Event) {
        let newFavoriteStatus = !getFavoriteStatus(event: event)
        let identifier = getEventFavoritesStorageIdentifier(for: event)
        favoritesStorage.setFavoriteStatus(identifier: identifier, isFavorite: newFavoriteStatus)

        let notificationPayload = DidUpdateEventFavoriteStatusNotificationPayload(
            event: event,
            favoriteStatus: newFavoriteStatus
        )

        NotificationCenter.default.post(name: .didUpdateEventFavoriteStatus, object: notificationPayload)
    }

    func addToFavorites(event: Event) {
        let identifier = getEventFavoritesStorageIdentifier(for: event)
        favoritesStorage.setFavoriteStatus(identifier: identifier, isFavorite: true)

        let notificationPayload = DidAddEventToFavoritesNotificationPayload(event: event)
        NotificationCenter.default.post(name: .didAddEventToFavorites, object: notificationPayload)
    }

    func removeFromFavorites(event: Event) {
        let identifier = getEventFavoritesStorageIdentifier(for: event)
        favoritesStorage.setFavoriteStatus(identifier: identifier, isFavorite: false)

        let notificationPayload = DidRemoveEventFromFavoritesNotificationPayload(event: event)
        NotificationCenter.default.post(name: .didRemoveEventFromFavorites, object: notificationPayload)
    }
}
