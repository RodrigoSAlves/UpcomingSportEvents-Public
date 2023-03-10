//
//  UIColor.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 13/02/2023.
//

import UIKit

extension UIColor {
    // Main Colors
    static var mainBackgroundColor: UIColor { return UIColor(named: "MainBackgroundColor")! }
    static var navBarBarButtonItemsTintColor: UIColor { return UIColor(named: "NavBarBarButtonItemsTintColor")! }
    static var navBarLogoTintColor: UIColor { return UIColor(named: "NavBarLogoTintColor")! }

    // Sport Section Header Colors
    static var sportHeaderBackgroundColor: UIColor { return UIColor(named: "SportHeaderBackgroundColor")! }
    static var sportHeaderExpandButtonTintColor: UIColor { return UIColor(named: "SportHeaderExpandButtonTintColor")! }
    static var sportHeaderTitleTextColor: UIColor { return UIColor(named: "SportHeaderTitleTextColor")! }

    // Favorite Icon Colors
    static var favoriteActiveColor: UIColor { return UIColor(named: "FavoriteActiveColor")! }
    static var favoriteInactiveColor: UIColor { return UIColor(named: "FavoriteInactiveColor")! }

    // Event List Colors
    static var eventCardBackgroundColor: UIColor { return UIColor(named: "EventCardBackgroundColor")! }

    // Custom Alert View Colors
    static var customAlertViewBackgroundColor: UIColor { return UIColor(named: "CustomAlertViewBackgroundColor")! }
    static var customAlertViewContainerColor: UIColor { return UIColor(named: "CustomAlertViewContainerColor")! }
}
