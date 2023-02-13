//
//  PresentableError.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import Foundation
import UIKit

protocol PresentableError: Error {
    var icon: UIImage? { get }
    var message: String { get }
    var title: String { get }
}
