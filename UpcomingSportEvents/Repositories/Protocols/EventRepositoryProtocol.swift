//
//  EventRepositoryProtocol.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 12/02/2023.
//

import Foundation

protocol EventRepositoryProtocol {
    func getEventsBySport(completion: @escaping (Result<[EventsBySport], GetEventsBySportError>) -> Void)
}
