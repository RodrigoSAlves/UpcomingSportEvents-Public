//
//  FavoritesStorageProtocol.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 12/02/2023.
//

import Foundation

protocol FavoritesStorageProtocol {
    func getFavoriteStatus(identifier: String) -> Bool
    func setFavoriteStatus(identifier: String, isFavorite: Bool)
}
