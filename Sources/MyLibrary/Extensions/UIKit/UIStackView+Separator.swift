//
//  UIStackView+Separator.swift
//  
//
//  Created by Станислав Терентьев on 27.12.2022.
//

import Foundation
import UIKit
import SnapKit

public extension UIStackView {
    
    func addHorizontalSeparators(color: UIColor) {
        var i = self.arrangedSubviews.count - 1
        while i > 0 {
            let separator = self.createSeparator(color: color)
            self.insertArrangedSubview(separator, at: i)
            separator.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
            i -= 1
        }
    }

    private func createSeparator(color: UIColor) -> UIView {
        let separator = UIView()
        let separatorSubView = UIView()
        separator.addSubview(separatorSubView)
        separatorSubView.backgroundColor = color
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorSubView.snp.makeConstraints({ maker in
            maker.left.equalToSuperview().offset(20)
            maker.right.equalToSuperview().offset(-20)
            maker.top.bottom.equalToSuperview()
        })
        return separator
    }
}
