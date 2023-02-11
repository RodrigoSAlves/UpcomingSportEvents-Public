//
//  SportsService.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Alamofire
import Foundation

protocol SportsServiceProtocol {
    func getAllEvents(completion: @escaping ((Result<String, Error>) -> Void))
}

final class SportsService: SportsServiceProtocol {
    let baseURL: URL

    init(baseURL: URL) {
        self.baseURL = baseURL
    }

    func getAllEvents(completion: @escaping ((Result<String, Error>) -> Void)) {
        guard var endpointURL = URL(string: baseURL.absoluteString) else {
            return
        }

        endpointURL.appendPathComponent("/api/sports")
        print(endpointURL)

        AF.request(endpointURL).response { response in
            debugPrint(response)
        }
    }
}
