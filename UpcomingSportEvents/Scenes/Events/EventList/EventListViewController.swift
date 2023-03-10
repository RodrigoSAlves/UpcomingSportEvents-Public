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
        static let defaultSportsTableViewCellHeight: CGFloat = 124.0
        static let defaultSportSectionHeaderHeight: CGFloat = 35.0
        static let defaultEventCollectionViewCellWidth: CGFloat = 225.0
    }

    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var loadingEventsLabel: UILabel!
    @IBOutlet weak var errorStackView: UIStackView!
    @IBOutlet weak var retryButton: UIButton!

    var viewModel: EventListViewModel?
    var viewConstructor: ViewConstructorProtocol?

    var collectionViewOffsets = [Int: CGFloat]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.viewWillAppear()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupUI()
    }

    func setupNavBar() {
        addLogoToNavbar()
        setNavBarRightButton(image: .user, action: #selector(didTapProfileButton))
    }

    @objc func didTapProfileButton() {
    }

    func setupUI() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.showsVerticalScrollIndicator = false
        mainTableView.showsHorizontalScrollIndicator = false
        mainTableView.separatorStyle = .none

        mainTableView.register(
            UINib(nibName: HorizontalCollectionViewTableViewCell.nibIdentifier, bundle: nil),
            forCellReuseIdentifier: HorizontalCollectionViewTableViewCell.identifier
        )

        mainTableView.register(
            UINib(nibName: ExpandableSectionHeaderView.nibIdentifier, bundle: nil),
            forHeaderFooterViewReuseIdentifier: ExpandableSectionHeaderView.identifier
        )

        retryButton.setCornerRadius(GlobalConstants.defaultCornerRadius)
    }

    func presentError(error: PresentableError) {
        let actionHandler: CustomAlertViewController.LayoutOptions.ActionHandler = { [weak self] alertViewController in
            alertViewController.dismiss(animated: true)
            self?.errorStackView.fadeIn()
        }

        let options = CustomAlertViewController.LayoutOptions(
            icon: error.icon,
            title: error.title,
            message: error.message,
            actionButtonTitle: "OK",
            actionButtonHandler: actionHandler
        )

        if let customAlertViewController = viewConstructor?.getCustomAlertViewController(layoutOptions: options) {
            present(customAlertViewController, animated: true)
        }
    }

    @IBAction func didTapRetryButton(_ sender: Any) {
        viewModel?.didTapRetryButton()
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
        return viewModel.getSportSectionExpansionState(sport: eventsBySportElement.sport) ? 1 : 0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let viewModel,
              let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ExpandableSectionHeaderView.identifier) as? ExpandableSectionHeaderView else {
            return UIView()
        }

        let sport = viewModel.eventsBySport[section].sport

        headerView.fill(
            sectionIdentifier: viewModel.getSportSectionIdentifier(sport: sport),
            title: sport.name,
            leftIcon: SportIcon.getMainIcon(for: sport),
            isExpanded: viewModel.getSportSectionExpansionState(sport: sport)
        )

        headerView.containerView.backgroundColor = .sportHeaderBackgroundColor
        headerView.titleLabel.textColor = .sportHeaderTitleTextColor
        headerView.toggleSectionExpansionButton.tintColor = .sportHeaderExpandButtonTintColor
        headerView.leftIcon.tintColor = .sportHeaderTitleTextColor

        let viewHeight = self.tableView(tableView, heightForHeaderInSection: section)
        headerView.containerView.setCornerRadius(viewHeight / 2)
        headerView.delegate = self

        return headerView
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: HorizontalCollectionViewTableViewCell.identifier, for: indexPath)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? HorizontalCollectionViewTableViewCell else {
            return
        }

        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.section)
        tableViewCell.collectionViewOffset = collectionViewOffsets[indexPath.section] ?? 0
    }

    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? HorizontalCollectionViewTableViewCell else {
            return
        }

        collectionViewOffsets[indexPath.section] = tableViewCell.collectionViewOffset
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
        guard let viewModel,
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionViewCell.identifier, for: indexPath) as? EventCollectionViewCell else {
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
        return CGSize(width: Constants.defaultEventCollectionViewCellWidth, height: collectionView.frame.height)
    }
}

extension EventListViewController: ExpandableSectionHeaderViewDelegate {
    func didTapToggleSectionExpansionButton(sectionIdentifier: String) {
        viewModel?.toggleSportSectionExpansion(sectionIdentifier: sectionIdentifier)
    }
}

extension EventListViewController: EventCollectionViewCellDelegate {
    func didTapMakeFavorite(event: Event) {
        viewModel?.toggleFavoriteForEvent(event: event)
    }
}

extension EventListViewController: EventListViewModelDelegate {
    func didUpdateIsLoadingSportingEvents(isLoadingSportingEvents: Bool) {
        if isLoadingSportingEvents {
            loadingEventsLabel.fadeIn()
        } else {
            loadingEventsLabel.fadeOut()
        }
    }

    func didFinishLoadingSportsAndEvents() {
        mainTableView.reloadData()
        mainTableView.fadeIn()
    }

    func didUpdateGetEventsBySportError(error: GetEventsBySportError?) {
        if let error {
            presentError(error: error)
            mainTableView.fadeOut()
        } else {
            errorStackView.fadeOut()
        }
    }

    func didToggleExpansionForSection(section: Int, isExpanded: Bool) {
        let indexPaths = [IndexPath(row: 0, section: section)]

        if isExpanded {
            mainTableView.insertRows(at: indexPaths, with: .fade)
        } else {
            mainTableView.deleteRows(at: indexPaths, with: .fade)
        }

        if let expandableSectionHeaderView = mainTableView.headerView(forSection: section) as? ExpandableSectionHeaderView {
            expandableSectionHeaderView.setIsExpanded(isExpanded: isExpanded)
        }
    }

    func didUpdateFavoriteStatusForEventAt(section: Int, originalIndex: Int, newIndex: Int) {
        guard let cell = mainTableView.cellForRow(at: IndexPath(row: .zero, section: section)) as? HorizontalCollectionViewTableViewCell else {
            return
        }

        cell.collectionView.performBatchUpdates {
            cell.collectionView.deleteItems(at: [IndexPath(row: originalIndex, section: .zero)])
            cell.collectionView.insertItems(at: [IndexPath(row: newIndex, section: .zero)])
        }
    }
}
