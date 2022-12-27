//
//  UIColor+HexColor.swift
//  
//
//  Created by Станислав Терентьев on 27.12.2022.
//

import Foundation
import UIKit

public extension UIColor {
    
    convenience init?(fromHexString: String, alpha: CGFloat? = 1.0) {
    // Convert hex string to an integer
    let hexint = Int(UIColor.colorInteger(fromHexString: fromHexString))
    let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
    let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
    let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
    let alpha = alpha!
    
    // Create color object, specifying alpha as well
    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
  
  private static func colorInteger(fromHexString: String) -> UInt64 {
    var hexInt: UInt64 = 0
    // Create scanner
    let scanner: Scanner = Scanner(string: fromHexString)
    // Tell scanner to skip the # character
    scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
    // Scan hex value
    scanner.scanHexInt64(&hexInt)
    return hexInt
  }
}
