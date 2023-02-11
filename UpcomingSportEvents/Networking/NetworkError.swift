//
//  NetworkError.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case serializationFailure
    case noInternetConnection
    case other
}
