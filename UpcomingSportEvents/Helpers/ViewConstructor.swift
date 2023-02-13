//
//  ViewConstructor.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 10/02/2023.
//

import UIKit

protocol ViewConstructorProtocol {
    func getEventListViewController() -> UINavigationController
    func getCustomAlertViewController(layoutOptions: CustomAlertViewController.LayoutOptions) -> CustomAlertViewController
}

struct ViewConstructor: ViewConstructorProtocol {
    func getEventListViewController() -> UINavigationController {
        let viewController = EventListViewController.instantiate()
        viewController.viewModel = DIContainer.shared.resolve()
        viewController.viewModel?.delegate = viewController
        viewController.viewConstructor = DIContainer.shared.resolve()

        return UINavigationController.init(rootViewController: viewController)
    }

    func getCustomAlertViewController(layoutOptions: CustomAlertViewController.LayoutOptions) -> CustomAlertViewController {
        let viewController = CustomAlertViewController.instantiate()
        viewController.options = layoutOptions
        return viewController
    }
}
