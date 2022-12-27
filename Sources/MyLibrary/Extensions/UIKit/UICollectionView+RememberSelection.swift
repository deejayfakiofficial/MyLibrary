//
//  UICollectionView+RememberSelection.swift
//  
//
//  Created by Станислав Терентьев on 27.12.2022.
//

import UIKit

public extension UICollectionView {
    
    func reloadDataSavingSelections() {
        let selectedItems = indexPathsForSelectedItems
        reloadData()
        if let selectedItems = selectedItems {
            for indexPath in selectedItems {
                selectItem(at: indexPath, animated: false, scrollPosition: ScrollPosition.left)
            }
        }
    }
}
