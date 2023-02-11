//
//  EventListTableViewCell.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import UIKit

class EventListTableViewCell: UITableViewCell {
    static let nibIdentifier = "EventListTableViewCell"
    static let identifier = "EventListTableViewCell"

    @IBOutlet weak var mainCollectionView: UICollectionView!

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

extension EventListTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionViewCell.identifier, for: indexPath) as? EventCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.fill(event: events[indexPath.row])

        return cell
    }
}
