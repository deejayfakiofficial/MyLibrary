//
//  UINavigationBar+RightBarItem.swift
//  
//
//  Created by Станислав Терентьев on 27.12.2022.
//

import Foundation
import UIKit

public extension UINavigationBar {

    func addRightSubview(_ rightSubview: UIView, rightOffset: CGPoint) {
        for subview in self.subviews where subview.subviews.first(where: { $0 is UILabel }) != nil {
            subview.addSubview(rightSubview)
            
            rightSubview.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                rightSubview.widthAnchor.constraint(equalToConstant: rightSubview.frame.width),
                rightSubview.heightAnchor.constraint(equalToConstant: rightSubview.frame.height),
                rightSubview.trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: rightOffset.x),
                rightSubview.bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: rightOffset.y)
            ])
            break
        }
    }
}
