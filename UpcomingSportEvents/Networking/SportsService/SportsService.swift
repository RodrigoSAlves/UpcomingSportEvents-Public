//
//  SportsService.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Alamofire
import Foundation

protocol SportsServiceProtocol {
    func getEventsBySport(completion: @escaping ((Result<[Sport], NetworkError>) -> Void))
}

final class SportsService: BaseService, SportsServiceProtocol {
    lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }()

    func getEventsBySport(completion: @escaping ((Result<[Sport], NetworkError>) -> Void)) {
        guard var endpointURL = URL(string: baseURL.absoluteString) else {
            return
        }

        endpointURL.appendPathComponent("/api/sports")

        AF.request(endpointURL).validate().responseDecodable(of: [Sport].self, decoder: decoder) { response in
            completion(self.handleResult(result: response.result))
        }
    }
}
