//
//  Storyboarded.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 10/02/2023.
//

import Foundation
import UIKit

protocol Storyboarded {
    static var storyboardIdentifier: String { get }
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {

    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]

        let storyboard = UIStoryboard(name: storyboardIdentifier, bundle: Bundle.main)

        guard let viewController = storyboard.instantiateViewController(withIdentifier: className) as? Self else {
            fatalError("Could not find ViewController in Storyboard with identifier \(storyboardIdentifier) using the storyboardIdentifier \(className)")
        }

        return viewController
    }
}
