//
//  SportsService.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Alamofire
import Foundation

final class SportsService: BaseService, SportsServiceProtocol {

    struct Endpoint {
        static func getEventsBySport(baseURL: URL) -> URL {
            return baseURL.appendingPathComponent("/api/sports")
        }
    }

    lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }()

    func getAllSportsEagerLoadedWithEvents(completion: @escaping ((Result<[SportData], NetworkError>) -> Void)) {
        let endpointURL = SportsService.Endpoint.getEventsBySport(baseURL: baseURL)
        /*
        AF.request(endpointURL)
            .validate()
            .responseDecodable(of: [SportData].self, decoder: decoder) { response in
                completion(self.handleResult(result: response.result))
            }
        */

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {

            if Int.random(in: 0...100) > 90 {
                completion(.failure(.serializationFailure))
            } else {
                completion(.success([
                    SportData(
                        id: "FOOT",
                        name: "SOCCER",
                        events: [
                            EventData(id: "29135390", name: "Juventus FC - Paris Saint-Germain", sportId: "FOOT", startTime: Date(timeIntervalSince1970: 1667447160))
                        ]
                    ),
                    SportData(
                        id: "SNOO",
                        name: "SNOOKER",
                        events: [
                            EventData(id: "29135390", name: "Judd Trump - Mark Allen", sportId: "SNOO", startTime: Date(timeIntervalSince1970: 1677214560))
                        ]
                    )
                ]))
            }
        }
    }
}
