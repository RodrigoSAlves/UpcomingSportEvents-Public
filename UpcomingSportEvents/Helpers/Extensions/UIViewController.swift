//
//  UIViewController.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 13/02/2023.
//

import UIKit

extension UIViewController {

    struct NavBarConstants {
        static let defaultNavBarLogoSize: CGSize = CGSize(width: 150.0, height: 40.0)
        static let defaultNavBarBarButtonItemSize: CGSize = CGSize(width: 22.5, height: 22.5)
    }

    func addLogoToNavbar() {
        let logoImageView = UIImageView(image: .navBarLogoWhite)
        logoImageView.frame = CGRect(origin: .zero, size: NavBarConstants.defaultNavBarLogoSize)
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.tintColor = .navBarLogoTintColor

        let imageItem = UIBarButtonItem.init(customView: logoImageView)
        let widthConstraint = logoImageView.widthAnchor.constraint(equalToConstant: NavBarConstants.defaultNavBarLogoSize.width)
        let heightConstraint = logoImageView.heightAnchor.constraint(equalToConstant: NavBarConstants.defaultNavBarLogoSize.height)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
        navigationItem.leftBarButtonItem = imageItem
    }

    func setNavBarRightButton(image: UIImage, tintColor: UIColor = .navBarBarButtonItemsTintColor, action: Selector) {
        let containerView = UIControl(frame: CGRect(origin: .zero, size: NavBarConstants.defaultNavBarBarButtonItemSize))
        containerView.addTarget(self, action: action, for: .touchUpInside)

        let imageView = UIImageView(frame: CGRect(origin: .zero, size: NavBarConstants.defaultNavBarBarButtonItemSize))
        imageView.image = image
        imageView.tintColor = tintColor
        containerView.addSubview(imageView)

        let searchBarButtonItem = UIBarButtonItem(customView: containerView)
        searchBarButtonItem.width = NavBarConstants.defaultNavBarBarButtonItemSize.width

        navigationItem.rightBarButtonItem = searchBarButtonItem
    }
}
