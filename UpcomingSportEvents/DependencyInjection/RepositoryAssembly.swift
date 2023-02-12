//
//  RepositoryAssembly.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Swinject

final class RepositoryAssembly: Assembly {

    func assemble(container: Container) {
        container.register(EventRepositoryProtocol.self) { resolver in
            guard let sportsService = resolver.resolve(SportsServiceProtocol.self) else {
                fatalError("Could not resolve SportsServiceProtocol dependency")
            }

            return EventRepository(sportsService: sportsService)
        }

        container.register(FavoritesRepositoryProtocol.self) { resolver in
            guard let favoritesStorage = resolver.resolve(FavoritesStorageProtocol.self) else {
                fatalError("Could not resolve FavoritesStorageProtocol dependency")
            }

            return FavoritesRepository(favoritesStorage: favoritesStorage)
        }
    }
}
