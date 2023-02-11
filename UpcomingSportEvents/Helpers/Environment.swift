//
//  Environment.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Foundation

public enum Environment {
    enum Keys {
        enum Plist {
            static let sportsServiceBaseURL = "SPORTS_SERVICE_BASE_URL"
        }
    }

    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()

    static let sportsServiceBaseURL: URL = {
        guard let baseURLString = Environment.infoDictionary[Keys.Plist.sportsServiceBaseURL] as? String else {
            fatalError("Sports Service Base URL not defined for this environment")
        }

        guard let baseURL = URL(string: baseURLString) else {
            fatalError("Sports Service Base URL is not a valid URL")
        }

        return baseURL
    }()
}
