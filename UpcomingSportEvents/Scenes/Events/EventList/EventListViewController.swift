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

    struct Constants {
        static let defaultSportsTableViewCellHeight: CGFloat = 100.0
        static let defaultSportSectionHeaderHeight: CGFloat = 35.0
    }

    @IBOutlet weak var mainTableView: UITableView!

    var viewModel: EventListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.showsVerticalScrollIndicator = false
        mainTableView.showsHorizontalScrollIndicator = false

        mainTableView.register(
            UINib(nibName: EventListTableViewCell.nibIdentifier, bundle: nil),
            forCellReuseIdentifier: EventListTableViewCell.identifier
        )
    }
}

extension EventListViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.eventsBySport.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SportSectionHeaderView()

        if let viewModel {
            let eventsBySportElement = viewModel.eventsBySport[section]
            headerView.fill(sport: eventsBySportElement.sport)
        }

        headerView.delegate = self

        return headerView
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel, let cell = tableView.dequeueReusableCell(withIdentifier: EventListTableViewCell.identifier, for: indexPath) as? EventListTableViewCell else {
            return UITableViewCell()
        }

        cell.fill(events: viewModel.eventsBySport[indexPath.section].events)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.defaultSportSectionHeaderHeight
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.defaultSportsTableViewCellHeight
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

extension EventListViewController: SportSectionHeaderViewDelegate {
    func didTapToggleSectionButton(sport: Sport) {
        print("Did tap \(sport.name)")
    }
}
