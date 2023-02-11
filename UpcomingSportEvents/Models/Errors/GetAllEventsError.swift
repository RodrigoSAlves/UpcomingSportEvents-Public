//
//  GetAllEventsError.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Foundation

enum GetAllEventsError: PresentableError {
    case networkError(NetworkError)

    var title: String {
        switch self {
        case .networkError(let networkError):
            switch networkError {
            case .noInternetConnection:
                return "Connectivity Error"
            default:
                return "Server Error"
            }
        }
    }

    var message: String {
        switch self {
        case .networkError(let networkError):
            switch networkError {
            case .noInternetConnection:
                return "It appears you are not connected to the internet. Please check your connection and try again"
            default:
                return "Something went wrong while communicating with our servers."
            }
        }
    }
}
