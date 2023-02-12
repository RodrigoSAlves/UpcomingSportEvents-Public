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
        guard let viewModel else {
            return 0
        }

        let eventsBySportElement = viewModel.eventsBySport[section]
        return viewModel.isExpanded(sport: eventsBySportElement.sport) ? 1 : 0
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventListTableViewCell.identifier, for: indexPath) as? EventListTableViewCell else {
            return UITableViewCell()
        }

        cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.section)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.defaultSportSectionHeaderHeight
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.defaultSportsTableViewCellHeight
    }
}

extension EventListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.eventsBySport[collectionView.tag].events.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionViewCell.identifier, for: indexPath) as? EventCollectionViewCell else {
            return UICollectionViewCell()
        }

        let event = viewModel.eventsBySport[collectionView.tag].events[indexPath.row]

        cell.fill(
            event: event,
            isFavorite: viewModel.isFavorite(event: event)
        )

        cell.delegate = self

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 225.0, height: collectionView.frame.height)
    }
}

extension EventListViewController: SportSectionHeaderViewDelegate {
    func didTapToggleSectionButton(sport: Sport) {
        viewModel?.toggleSportExpansion(sport: sport)
    }
}

extension EventListViewController: EventCollectionViewCellDelegate {
    func didTapMakeFavorite(event: Event) {
        viewModel?.toggleFavoriteForEvent(event: event)
    }
}

extension EventListViewController: EventListViewModelDelegate {
    func didFinishLoadingSportsAndEvents() {
        mainTableView.reloadData()
    }

    func didFailToLoadSportsAndEvents(error: GetEventsBySportError) {
        print(error.message)
    }

    func didToggleExpansionForSection(section: Int, isExpanded: Bool) {
        let indexPaths = [IndexPath(row: 0, section: section)]
        if isExpanded {
            mainTableView.insertRows(at: indexPaths, with: .fade)
        } else {
            mainTableView.deleteRows(at: indexPaths, with: .fade)
        }
    }

    func didUpdateFavoriteStatusForEventAt(section: Int, originalIndex: Int, newIndex: Int) {
        guard let cell = mainTableView.cellForRow(at: IndexPath(row: .zero, section: section)) as? EventListTableViewCell else {
            return
        }

        cell.mainCollectionView.performBatchUpdates {
            cell.mainCollectionView.deleteItems(at: [IndexPath(row: originalIndex, section: .zero)])
            cell.mainCollectionView.insertItems(at: [IndexPath(row: newIndex, section: .zero)])
        }
    }
}
