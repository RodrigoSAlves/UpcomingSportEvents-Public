//
//  BaseService.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Alamofire
import Foundation

class BaseService {
    let baseURL: URL

    init(baseURL: URL) {
        self.baseURL = baseURL
    }

    func handleResult<T>(result: Result<T, AFError>) -> Result<T, NetworkError> {
        switch result {
        case .success(let data):
            return .success(data)
        case .failure(let error):
            return .failure(convertAFErrorToNetworkError(error: error))
        }
    }

    func convertAFErrorToNetworkError(error: AFError) -> NetworkError {
        if let urlError = error.underlyingError as? URLError, urlError.code == URLError.notConnectedToInternet {
            return .noInternetConnection
        } else {
            switch error {
            case .responseSerializationFailed:
                return .serializationFailure
            case .invalidURL:
                return .invalidURL
            case .responseValidationFailed:
                return .invalidResponse
            default:
                return .other
            }
        }
    }
}
