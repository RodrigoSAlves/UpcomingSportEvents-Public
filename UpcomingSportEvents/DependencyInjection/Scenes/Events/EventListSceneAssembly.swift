//
//  EventListSceneAssembly.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 10/02/2023.
//

import Swinject

final class EventListSceneAssembly: Assembly {

    func assemble(container: Container) {
        container.register(EventListViewModel.self) { resolver in
            guard let eventRepository = resolver.resolve(EventRepositoryProtocol.self) else {
                fatalError("Could not resolve EventRepositoryProtocol dependency")
            }

            guard let favoritesRepository = resolver.resolve(FavoritesRepositoryProtocol.self) else {
                fatalError("Could not resolve FavoritesRepositoryProtocol dependency")
            }

            return EventListViewModel(eventRepository: eventRepository, favoritesRepository: favoritesRepository)
        }
    }
}
