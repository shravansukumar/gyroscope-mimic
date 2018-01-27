//
//  HomeViewController.swift
//  gyroscope-copy
//
//  Created by Shravan Sukumar on 27/01/18.
//  Copyright © 2018 shravan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var bottomCollectionView: UICollectionView!
    
    // MARK: - Constants and Variables
    var titles = ["Week \n The week of June 6", "Step \n Average of 1790 steps per day"]
    let images = [#imageLiteral(resourceName: "map_icon"), #imageLiteral(resourceName: "steps_icon")]
    var tabBar = TabBarController()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        self.title = "LAST WEEK"
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        tabBar = storyboard.instantiateViewController(withIdentifier: "tabBarController") as! TabBarController
    }
        
    private func setupCollectionView() {
        bottomCollectionView.registerNib(viewClass: BottomCollectionViewCell.self)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(collectionViewCellClass: BottomCollectionViewCell.self, forIndexPath: indexPath)
        cell.titleLabel.text = titles[indexPath.item]
        cell.displayImageView.image = images[indexPath.item]
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            tabBar.selectedIndex = 0
        } else {
            tabBar.selectedIndex = 1
        }
    }
}

