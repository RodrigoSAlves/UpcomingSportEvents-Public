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
        mainCollectionView.reloadData()
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
