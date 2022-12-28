//
//  UIStackView+Separator.swift
//  
//
//  Created by Станислав Терентьев on 27.12.2022.
//

import Foundation
import UIKit

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
        separatorSubView.translatesAutoresizingMaskIntoConstraints = false
        separatorSubView.backgroundColor = color
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        NSLayoutConstraint.activate([
            separatorSubView.leadingAnchor.constraint(equalTo: separator.leadingAnchor, constant: 20),
            separatorSubView.trailingAnchor.constraint(equalTo: separator.trailingAnchor, constant: -20),
            separatorSubView.topAnchor.constraint(equalTo: separator.topAnchor),
            separatorSubView.bottomAnchor.constraint(equalTo: separator.bottomAnchor)
        ])
        return separator
    }
}
