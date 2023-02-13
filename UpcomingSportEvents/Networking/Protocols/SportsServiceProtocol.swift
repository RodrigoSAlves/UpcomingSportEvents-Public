//
//  SportsServiceProtocol.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 13/02/2023.
//

import Foundation

protocol SportsServiceProtocol {

    /// Calls the Sports API to retrieve all Sports, eager loading events
    /// If the request is successful, it returns an array of SportData instances, representing the data provided by the API
    /// If an error occurs, it returns a Network error
    /// - Parameter completion: The result of the operation
    func getAllSportsEagerLoadedWithEvents(completion: @escaping ((Result<[SportData], NetworkError>) -> Void))
}
