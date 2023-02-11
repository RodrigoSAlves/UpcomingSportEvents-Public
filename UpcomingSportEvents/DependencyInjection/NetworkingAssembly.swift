//
//  NetworkingAssembly.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Swinject

final class NetworkingAssembly: Assembly {

    func assemble(container: Container) {
        container.register(SportsServiceProtocol.self) { _ in
            return SportsService(baseURL: Environment.sportsServiceBaseURL)
        }
    }
}
