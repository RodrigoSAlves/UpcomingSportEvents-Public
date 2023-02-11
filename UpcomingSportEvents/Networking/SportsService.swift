//
//  SportsService.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Foundation

protocol SportsServiceProtocol {
    func getSportingEvents(completion: @escaping ((Result<String, Error>) -> Void))
}

final class SportsService: SportsServiceProtocol {
    let baseURL: URL

    init(baseURL: URL) {
        self.baseURL = baseURL
    }

    func getSportingEvents(completion: @escaping ((Result<String, Error>) -> Void)) {
        // TODO: Make API request
    }
}
