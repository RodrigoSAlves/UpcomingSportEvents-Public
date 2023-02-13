//
//  ViewConstructor.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 10/02/2023.
//

import UIKit

protocol ViewConstructorProtocol {
    func getEventListViewController() -> UINavigationController
}

struct ViewConstructor: ViewConstructorProtocol {
    func getEventListViewController() -> UINavigationController {
        let viewController = EventListViewController.instantiate()
        viewController.viewModel = DIContainer.shared.resolve()
        viewController.viewModel?.delegate = viewController

        return UINavigationController.init(rootViewController: viewController)
    }
}
