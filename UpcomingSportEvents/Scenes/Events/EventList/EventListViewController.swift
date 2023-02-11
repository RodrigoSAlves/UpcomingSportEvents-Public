//
//  EventListViewController.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 10/02/2023.
//

import Foundation
import UIKit

class EventListViewController: UIViewController, Storyboarded {
    static let storyboardIdentifier: String = "EventList"

    var viewModel: EventListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
