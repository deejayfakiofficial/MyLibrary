//
//  String+Size.swift
//  
//
//  Created by Станислав Терентьев on 26.12.2022.
//

import Foundation
import UIKit

public extension String {
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
