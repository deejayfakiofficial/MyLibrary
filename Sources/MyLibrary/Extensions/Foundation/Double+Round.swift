//
//  Double+Round.swift
//  
//
//  Created by Станислав Терентьев on 26.12.2022.
//

import Foundation

public extension Double {
    
    func round(to digits: Int = 2) -> Double {
        let devider = pow(10.0, Double(digits))
        return (self * Double(devider)).rounded() / Double(devider)
    }
}
