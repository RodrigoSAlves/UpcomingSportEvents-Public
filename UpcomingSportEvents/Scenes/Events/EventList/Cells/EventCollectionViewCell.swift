//
//  EventCollectionViewCell.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    static let nibIdentifier = "EventCollectionViewCell"
    static let identifier = "EventCollectionViewCell"

    @IBOutlet weak var eventNameLabel: UILabel!

    func fill(event: Event) {
        eventNameLabel.text = event.name
    }
}
