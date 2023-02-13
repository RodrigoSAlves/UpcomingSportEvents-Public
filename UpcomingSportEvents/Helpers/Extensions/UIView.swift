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

    func fadeIn(duration: TimeInterval? = nil, completion: ((Bool) -> Void)? = nil) {
        isHidden = false

        let animations: () -> Void = {
            self.alpha = 1.0
        }

        UIView.animate(withDuration: duration ?? GlobalConstants.defaultOpacityAnimationDuration, animations: animations, completion: completion)
    }

    func fadeOut(duration: TimeInterval? = nil, completion: ((Bool) -> Void)? = nil) {
        isHidden = false

        let animations: () -> Void = {
            self.alpha = 0.0
        }

        let completion: (Bool) -> Void = { bool in
            self.isHidden = true
            completion?(bool)
        }

        UIView.animate(withDuration: duration ?? GlobalConstants.defaultOpacityAnimationDuration, animations: animations, completion: completion)
    }
}
