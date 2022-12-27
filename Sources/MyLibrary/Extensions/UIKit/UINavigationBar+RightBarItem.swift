//
//  UINavigationBar+RightBarItem.swift
//  
//
//  Created by Станислав Терентьев on 27.12.2022.
//

import Foundation
import UIKit
import SnapKit

extension UINavigationBar {

    func addRightSubview(_ rightSubview: UIView, rightOffset: CGPoint) {
        for subview in self.subviews where subview.subviews.first(where: { $0 is UILabel }) != nil {
            subview.addSubview(rightSubview)
            rightSubview.snp.makeConstraints { (maker) in
                maker.width.equalTo(rightSubview.frame.width)
                maker.height.equalTo(rightSubview.frame.height)
                maker.right.equalToSuperview().offset(rightOffset.x)
                maker.bottom.equalToSuperview().offset(rightOffset.y)
            }
            break
        }
    }
}
