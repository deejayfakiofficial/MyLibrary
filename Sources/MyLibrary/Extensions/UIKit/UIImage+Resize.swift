//
//  UIImage+Resize.swift
//  
//
//  Created by Станислав Терентьев on 27.12.2022.
//

import Foundation
import UIKit

public extension UIImage {
    
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
