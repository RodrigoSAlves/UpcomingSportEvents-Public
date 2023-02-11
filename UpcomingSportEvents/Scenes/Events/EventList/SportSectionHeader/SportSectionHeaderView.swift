//
//  SportSectionHeaderView.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import UIKit

protocol SportSectionHeaderViewDelegate: AnyObject {
    func didTapToggleSectionButton(sport: Sport)
}

class SportSectionHeaderView: UIDesignableView {
    override var nibIdentifier: String { "SportSectionHeaderView" }

    @IBOutlet weak var sportIconImageView: UIImageView!
    @IBOutlet weak var sportNameLabel: UILabel!
    @IBOutlet weak var toggleSectionCollapseButton: UIButton!

    weak var delegate: SportSectionHeaderViewDelegate?
    var sport: Sport?

    func fill(sport: Sport) {
        self.sport = sport
        sportNameLabel.text = sport.name
    }

    @IBAction func didTapToggleSectionCollapseButton(_ sender: Any) {
        guard let sport else {
            return
        }

        delegate?.didTapToggleSectionButton(sport: sport)
    }
}
