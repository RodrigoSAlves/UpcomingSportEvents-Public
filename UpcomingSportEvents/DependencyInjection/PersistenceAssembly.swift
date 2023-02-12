//
//  PersistenceAssembly.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 12/02/2023.
//

import Swinject

final class PersistenceAssembly: Assembly {

    func assemble(container: Container) {
        container.register(FavoritesStorageProtocol.self) { _ in
            // Change the type of persistence effor
            return InMemoryFavoritesStorage()
        }
        .inObjectScope(.container)
    }
}
