//
//  ViewConstructor.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 10/02/2023.
//

import Foundation

protocol ViewConstructorProtocol {
    func getEventListViewController() -> EventListViewController
}

struct ViewConstructor: ViewConstructorProtocol {
    func getEventListViewController() -> EventListViewController {
        let viewController = EventListViewController.instantiate()
        viewController.viewModel = DIContainer.shared.resolve()
        return viewController
    }
}
