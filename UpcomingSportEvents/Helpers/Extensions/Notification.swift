//
//  Notification.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Foundation

extension Notification.Name {
    static let didUpdateEventFavoriteStatus = Notification.Name("didUpdateEventFavoriteStatus")
    static let didAddEventToFavorites = Notification.Name("didAddEventToFavorites")
    static let didRemoveEventFromFavorites = Notification.Name("didRemoveEventFromFavorites")
}
