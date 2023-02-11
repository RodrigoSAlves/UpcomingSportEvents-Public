//
//  EventListSceneAssembly.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 10/02/2023.
//

import Swinject

final class EventListSceneAssembly: Assembly {

    func assemble(container: Container) {
        container.register(EventListViewModel.self) { _ in
            return EventListViewModel()
        }
    }
}
