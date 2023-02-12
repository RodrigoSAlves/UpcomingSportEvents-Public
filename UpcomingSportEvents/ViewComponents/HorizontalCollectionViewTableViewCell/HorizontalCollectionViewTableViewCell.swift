//
//  EventListTableViewCell.swift
//  UpcomingSportEvents
//
//  Created by Rodrigo Alves on 11/02/2023.
//

import UIKit

class HorizontalCollectionViewTableViewCell: UITableViewCell {
    static let nibIdentifier = "HorizontalCollectionViewTableViewCell"
    static let identifier = "HorizontalCollectionViewTableViewCell"

    var collectionViewOffset: CGFloat {
        get {
            return collectionView.contentOffset.x
        }

        set {
            collectionView.setContentOffset(CGPoint(x: newValue, y: .zero), animated: false)
        }
    }

    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInsetAdjustmentBehavior = .never

        collectionView.register(
            UINib(nibName: EventCollectionViewCell.nibIdentifier, bundle: nil),
            forCellWithReuseIdentifier: EventCollectionViewCell.identifier
        )
    }

    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
}
