//
//  UIView.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 12/02/2023.
//

import UIKit

extension UIView {
    func setCornerRadius(_ cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
    }

    func makeRounded() {
        self.layer.cornerRadius = self.frame.height / 2
    }
}
