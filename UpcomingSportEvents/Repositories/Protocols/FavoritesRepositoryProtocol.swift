//
//  FavoritesRepositoryProtocol.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 12/02/2023.
//

import Foundation

protocol FavoritesRepositoryProtocol {
    func getFavoriteStatus(event: Event) -> Bool
    func toggleFavoriteStatus(event: Event)
    func addToFavorites(event: Event)
    func removeFromFavorites(event: Event)
}
