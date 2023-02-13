//
//  EventRepositoryProtocol.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 12/02/2023.
//

import Foundation

protocol EventRepositoryProtocol {

    /// Makes an external call to retrieve all sports and events and returns an array of EventBySport, with events ordered by `startTime` from earliest to latest.
    /// If an error occurs it returns a GetEventsBySportError
    /// - Parameter completion: The result of the operation
    func getEventsBySport(completion: @escaping (Result<[EventsBySport], GetEventsBySportError>) -> Void)
}
