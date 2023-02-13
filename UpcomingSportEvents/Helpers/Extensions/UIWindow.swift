//
//  UIWindow.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 13/02/2023.
//

import UIKit

extension UIWindow {
    func getTopMostController() -> UIViewController? {
        guard let rootViewController = self.rootViewController else {
            return nil
        }

        var topController: UIViewController? = rootViewController

        while let newTopController = topController?.presentedViewController {
            topController = newTopController
        }

        if let tabBarController = topController as? UITabBarController {
            topController = tabBarController.selectedViewController
        }

        if let navigationController = topController as? UINavigationController {
            topController = navigationController.topViewController
        }

        return topController
    }
}
