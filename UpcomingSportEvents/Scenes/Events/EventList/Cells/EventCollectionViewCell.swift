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

    struct Constants {
        static let defaultContainerViewCornerRadius: CGFloat = 16.0
    }

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var firstOpponentLabel: UILabel!
    @IBOutlet weak var secondOpponentLabel: UILabel!
    @IBOutlet weak var makeFavoriteButton: UIButton!
    @IBOutlet weak var startTimeLabel: UILabel!

    weak var delegate: EventCollectionViewCellDelegate?
    var event: Event?
    var timer: Timer?

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.setCornerRadius(Constants.defaultContainerViewCornerRadius)
    }

    func fill(event: Event, isFavorite: Bool) {
        self.event = event
        firstOpponentLabel.text = event.firstOpponentName
        secondOpponentLabel.text = event.secondOpponentName

        makeFavoriteButton.tintColor = isFavorite ? .favoriteActiveColor : .favoriteInactiveColor
        updateStartTimeLabel()
        scheduleTimer()
    }

    func updateStartTimeLabel() {
        guard let event else {
            startTimeLabel.text = nil
            return
        }

        guard event.startTime > Date() else {
            startTimeLabel.text = "Already started"
            return
        }

        startTimeLabel.text = Date().getHoursMinutesSecondsRemaining(until: event.startTime) ?? ""
    }

    func scheduleTimer() {
        guard timer == nil else {
            return
        }

        guard let event, event.startTime > Date() else {
            timer?.invalidate()
            timer = nil

            return
        }

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self else {
                return
            }

            self.updateStartTimeLabel()
        }
    }

    @IBAction func didTapMakeFavoriteButton(_ sender: Any) {
        guard let event else {
            return
        }

        delegate?.didTapMakeFavorite(event: event)
    }
}
