//
//  InMemoryFavoritesStorage.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 12/02/2023.
//

import Foundation

final class InMemoryFavoritesStorage: FavoritesStorageProtocol {

    var favoritesStatuses: [String: Bool] = [:]

    func getFavoriteStatus(identifier: String) -> Bool {
        return favoritesStatuses[identifier] ?? false
    }

    func setFavoriteStatus(identifier: String, isFavorite: Bool) {
        favoritesStatuses[identifier] = isFavorite
    }
}
