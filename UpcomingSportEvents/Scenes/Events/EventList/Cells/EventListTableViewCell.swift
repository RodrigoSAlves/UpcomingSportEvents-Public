//
//  EventListTableViewCell.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import UIKit

class EventListTableViewCell: UITableViewCell {
    static let nibIdentifier = "EventListTableViewCell"
    static let identifier = "EventListTableViewCell"

    var collectionViewOffset: CGFloat {
        get {
            return mainCollectionView.contentOffset.x
        }

        set {
            mainCollectionView.setContentOffset(CGPoint(x: newValue, y: .zero), animated: false)
        }
    }

    @IBOutlet weak var mainCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        mainCollectionView.showsVerticalScrollIndicator = false
        mainCollectionView.showsHorizontalScrollIndicator = false
        mainCollectionView.contentInsetAdjustmentBehavior = .never

        mainCollectionView.register(
            UINib(nibName: EventCollectionViewCell.nibIdentifier, bundle: nil),
            forCellWithReuseIdentifier: EventCollectionViewCell.identifier
        )
    }

    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        mainCollectionView.delegate = dataSourceDelegate
        mainCollectionView.dataSource = dataSourceDelegate
        mainCollectionView.tag = row
        mainCollectionView.reloadData()
    }
}
