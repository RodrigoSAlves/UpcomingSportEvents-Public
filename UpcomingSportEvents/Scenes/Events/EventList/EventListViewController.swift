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

    @IBOutlet weak var mainTableView: UITableView!

    var viewModel: EventListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
}

extension EventListViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.eventsBySport.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension EventListViewController: EventListViewModelDelegate {
    func didFinishLoadingSportsAndEvents() {
        mainTableView.reloadData()
    }

    func didFailToLoadSportsAndEvents(error: GetEventsBySportError) {
        print(error.message)
    }
}
