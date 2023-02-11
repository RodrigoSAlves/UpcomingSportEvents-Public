//
//  EventListTableViewCell.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import UIKit

protocol EventListTableViewCellDelegate: AnyObject {
    func didTapMakeFavorite(event: Event)
    func isFavorite(event: Event) -> Bool
}

class EventListTableViewCell: UITableViewCell {
    static let nibIdentifier = "EventListTableViewCell"
    static let identifier = "EventListTableViewCell"

    @IBOutlet weak var mainCollectionView: UICollectionView!

    weak var delegate: EventListTableViewCellDelegate?

    var events: [Event] = [Event]()
    var sportId: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.showsVerticalScrollIndicator = false
        mainCollectionView.showsHorizontalScrollIndicator = false
        mainCollectionView.contentInsetAdjustmentBehavior = .never

        mainCollectionView.register(
            UINib(nibName: EventCollectionViewCell.nibIdentifier, bundle: nil),
            forCellWithReuseIdentifier: EventCollectionViewCell.identifier
        )
    }

    func fill(events: [Event]) {
        self.events = events
        self.sportId = events.first?.sportId
        mainCollectionView.reloadData()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didToggleEventFavoriteStatus),
            name: .didToggleEventFavoriteStatus,
            object: nil
        )
    }

    @objc func didToggleEventFavoriteStatus(_ notification: Notification) {
        guard let notificationPayload = notification.object as? ToggleEventFavoriteStatusNotificationPayload else {
            return
        }

        let event = notificationPayload.event

        guard event.sportId == sportId else {
            print("Not for this sport")
            return
        }

        guard let originalIndex = events.firstIndex(where: { $0.id == event.id }) else {
            print("Event not found in list")
            return
        }

        print("Event Index \(originalIndex)")

        events.sort {
            let isFirstElementFavorite = favoriteEvents[$0.id] ?? false
            let isSecondElementFavorite = favoriteEvents[$1.id] ?? false

            if isFirstElementFavorite == isSecondElementFavorite {
                return $0.startTime < $1.startTime
            } else {
                return isFirstElementFavorite
            }
        }

        let newIndex = events.firstIndex(where: { $0.id == event.id })!

        mainCollectionView.performBatchUpdates {
            mainCollectionView.deleteItems(at: [IndexPath(row: originalIndex, section: 0)])
            mainCollectionView.insertItems(at: [IndexPath(row: newIndex, section: 0)])
        }
    }
}

extension EventListTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionViewCell.identifier, for: indexPath) as? EventCollectionViewCell else {
            return UICollectionViewCell()
        }

        let event = events[indexPath.row]
        cell.fill(
            event: event,
            isFavorite: delegate?.isFavorite(event: event) ?? false
        )
        cell.delegate = self

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200.0, height: collectionView.frame.height)
    }
}

extension EventListTableViewCell: EventCollectionViewDelegate {
    func didTapMakeFavorite(event: Event) {
        delegate?.didTapMakeFavorite(event: event)
    }
}
