//
//  FavoritesRepositoryProtocol.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 12/02/2023.
//

import Foundation

protocol FavoritesRepositoryProtocol {

    /// Get current favorite status for a given `event` (
    /// - Parameter event: The event for which to check the favorite status
    /// - Returns: Returns true if the event is favorite, false otherwise
    func getFavoriteStatus(event: Event) -> Bool

    /// Toggles the favorite status for a given `event`.
    /// If the current favorite status is true, it becomes false, and vice-versa.
    /// - Parameter event: The event for which to toggle the favorite status
    func toggleFavoriteStatus(event: Event)

    /// Sets the favorite status for the given `event`to true
    /// - Parameter event: The event for which to set the favorite status
    func addToFavorites(event: Event)

    /// Sets the favorite status for the given `event`to false
    /// - Parameter event: The event for which to set the favorite status
    func removeFromFavorites(event: Event)
}
