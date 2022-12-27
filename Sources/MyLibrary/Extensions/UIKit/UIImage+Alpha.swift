//
//  UIImage+Alpha.swift
//  
//
//  Created by Станислав Терентьев on 27.12.2022.
//

import Foundation
import UIKit

public extension UIImage {

    func alpha(_ value: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
