//
//  PresentableError.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Foundation

protocol PresentableError: Error {
    var message: String { get }
    var title: String { get }
}
