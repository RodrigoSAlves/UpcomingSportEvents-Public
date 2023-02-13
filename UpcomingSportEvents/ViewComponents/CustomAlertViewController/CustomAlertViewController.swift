//
//  CustomAlertViewController.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 13/02/2023.
//

import UIKit

class CustomAlertViewController: UIViewController, Storyboarded {
    static var storyboardIdentifier: String { return "CustomAlertView" }

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!

    struct LayoutOptions {
        typealias ActionHandler = (CustomAlertViewController) -> Void

        let icon: UIImage?
        let title: String
        let message: String?
        let actionButtonTitle: String?
        let actionButtonHandler: ActionHandler?

        init() {
            self.icon = nil
            self.title = "Warning"
            self.message = nil
            self.actionButtonTitle = "OK"
            self.actionButtonHandler = nil
        }

        init(icon: UIImage?, title: String, message: String?, actionButtonTitle: String?, actionButtonHandler: ActionHandler?) {
            self.icon = icon
            self.title = title
            self.message = message
            self.actionButtonTitle = actionButtonTitle ?? "OK"
            self.actionButtonHandler = actionButtonHandler
        }
    }

    var options: LayoutOptions = LayoutOptions()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        containerView.setCornerRadius(GlobalConstants.defaultCornerRadius)
        actionButton.setCornerRadius(GlobalConstants.defaultCornerRadius)

        iconImageView.image = options.icon
        titleLabel.text = options.title
        messageLabel.text = options.message
        actionButton.setTitle(options.actionButtonTitle, for: .normal)
    }

    @IBAction func didTapActionButton(_ sender: Any) {
        options.actionButtonHandler?(self)
    }
}
