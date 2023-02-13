//
//  BaseServiceProtocol.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 13/02/2023.
//

import Foundation

protocol BaseServiceProtocol {

    /// Base URL used to generate concrete endpoint URLs
    var baseURL: URL { get }
}
