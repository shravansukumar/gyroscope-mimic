//
//  WeekViewController.swift
//  gyroscope-copy
//
//  Created by Shravan Sukumar on 27/01/18.
//  Copyright © 2018 shravan. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var collectionView: UICollectionView!
    
    let dates = ["Mon \n 6","Tue \n 7","Wed \n 8","Thu \n 9","Fri \n 10","Sat \n 11","Sun \n 12" ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }

    // MARK: - Private Methods
    private func setupCollectionView() {
        collectionView.registerNib(viewClass: WeekCollectionViewCell.self)
    }
}

// MARK: - UICollectionViewDataSource
extension WeekViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(collectionViewCellClass: WeekCollectionViewCell.self, forIndexPath: indexPath)
        cell.dateLabel.text = dates[indexPath.item]
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension WeekViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 150)
    }
}
