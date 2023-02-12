//
//  EventCollectionViewCell.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import UIKit

protocol EventCollectionViewCellDelegate: AnyObject {
    func didTapMakeFavorite(event: Event)
}

class EventCollectionViewCell: UICollectionViewCell {
    static let nibIdentifier = "EventCollectionViewCell"
    static let identifier = "EventCollectionViewCell"

    @IBOutlet weak var firstOpponentLabel: UILabel!
    @IBOutlet weak var secondOpponentLabel: UILabel!
    @IBOutlet weak var makeFavoriteButton: UIButton!
    @IBOutlet weak var startTimeLabel: UILabel!

    weak var delegate: EventCollectionViewCellDelegate?
    var event: Event?

    func fill(event: Event, isFavorite: Bool) {
        self.event = event
        firstOpponentLabel.text = event.firstOpponentName
        secondOpponentLabel.text = event.secondOpponentName

        makeFavoriteButton.backgroundColor = isFavorite ? .yellow : .darkGray

        let components = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: event.startTime)
        startTimeLabel.text = "\(components.hour ?? 0) : \(components.minute ?? 0) : \(components.second ?? 0)"
    }

    @IBAction func didTapMakeFavoriteButton(_ sender: Any) {
        guard let event else {
            return
        }

        delegate?.didTapMakeFavorite(event: event)
    }
}
