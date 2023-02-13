//
//  ExpandableSectionHeaderView.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import UIKit

protocol ExpandableSectionHeaderViewDelegate: AnyObject {
    func didTapToggleSectionExpansionButton(sectionIdentifier: String)
}

class ExpandableSectionHeaderView: UITableViewHeaderFooterView {
    static let nibIdentifier = "ExpandableSectionHeaderView"
    static let identifier = "ExpandableSectionHeaderView"

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var toggleSectionExpansionButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leftIcon: UIImageView!

    weak var delegate: ExpandableSectionHeaderViewDelegate?
    var sectionIdentifier: String?

    func fill(sectionIdentifier: String, title: String, leftIcon: UIImage?, isExpanded: Bool) {
        self.sectionIdentifier = sectionIdentifier
        self.titleLabel.text = title
        self.leftIcon.image = leftIcon
        self.setIsExpanded(isExpanded: isExpanded)
    }

    func setIsExpanded(isExpanded: Bool) {
        toggleSectionExpansionButton.setImage(isExpanded ? .chevronDown : .chevronUp, for: .normal)
    }

    @IBAction func didTapToggleSectionExpansionButton(_ sender: Any) {
        guard let sectionIdentifier else {
            return
        }

        delegate?.didTapToggleSectionExpansionButton(sectionIdentifier: sectionIdentifier)
    }
}
