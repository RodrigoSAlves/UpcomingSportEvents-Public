//
//  UIDesignableView.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import UIKit

protocol NibIdentifiable {
    var nibIdentifier: String { get }
}

class UIDesignableView: UIView, NibIdentifiable {
    var nibIdentifier: String { "UIDesignableView" }

    var view: UIView?

    init() {
        super.init(frame: .zero)
        self.xibSetup()
        self.setupView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetup()
        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xibSetup()
        self.setupView()
    }

    func xibSetup() {
        let view = loadViewFromNib()

        // use bounds not frame or it'll be offset
        view.frame = bounds

        // Make the view stretch with containing view
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]

        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)

        self.view = view
    }

    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibIdentifier, bundle: bundle)

        // Assumes UIView is top level and only object in CustomView.xib file
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {
            fatalError("Found unexpected view hierarchy for custom view component")
        }

        return view
    }

    func setupView() {}
}
