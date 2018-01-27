//
//  Extensions.swift
//  gyroscope-copy
//
//  Created by Shravan Sukumar on 27/01/18.
//  Copyright © 2018 shravan. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var lowerCaseFirst: String {
        var result = self
        result.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).lowercased())
        return result
    }
}

extension UIView {
    class func getNibName() -> String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    class func getCellIdentifier() -> String {
        return getNibName().lowerCaseFirst
    }
}

extension UICollectionView {
    func registerNib(viewClass: UIView.Type) {
        let nib = UINib(nibName: viewClass.getNibName(), bundle: nil)
        register(nib, forCellWithReuseIdentifier: viewClass.getCellIdentifier())
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(collectionViewCellClass: T.Type, forIndexPath indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: collectionViewCellClass.getCellIdentifier(), for: indexPath) as! T
    }
}
