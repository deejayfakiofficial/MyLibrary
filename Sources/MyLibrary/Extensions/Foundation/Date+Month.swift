//
//  Date+Month.swift
//  
//
//  Created by Станислав Терентьев on 26.12.2022.
//

import Foundation
import UIKit

public extension Date {
    
    func monthName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM")
        return dateFormatter.string(from: self)
    }
}
