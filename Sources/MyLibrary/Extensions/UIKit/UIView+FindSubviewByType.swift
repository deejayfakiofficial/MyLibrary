//
//  UIView+FindSubviewByType.swift
//  
//
//  Created by Станислав Терентьев on 27.12.2022.
//

import Foundation
import UIKit

public extension UIView {
    
    func findSubviewByType<T: UIView>(type: T.Type) -> T? {
        if let view = (self as? T) {
            return view
        }

        if self.subviews.count > 0 {
            for subView in self.subviews {
                if let view = subView.findSubviewByType(type: type) {
                    return view
                }
            }
        }
        return nil
    }
}
