//
//  NetworkingAssembly.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Foundation
import Swinject

final class NetworkingAssembly: Assembly {

    func assemble(container: Container) {
        container.register(SportsServiceProtocol.self) { _ in
            guard let baseURL = URL(string: "https://618d3aa7fe09aa001744060a.mockapi.io/api/sports") else {
                fatalError("Could not resolve baseURL for SportsService")
            }

            return SportsService(baseURL: baseURL)
        }
    }
}
