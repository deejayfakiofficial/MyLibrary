//
//  File.swift
//  
//
//  Created by Станислав Терентьев on 26.12.2022.
//

import Foundation

extension Double {
    func strigified(to digits: Int = 2, currency: String? = nil) -> String {
        let roundedString = String(format: "%.\(digits)f", self)
        if let currency = currency {
            let currencySymbol = (Locale.preferred as NSLocale).displayName(forKey: .currencySymbol, value: currency) ?? "RUB"
            let doubleToString = roundedString.appending(" \(currencySymbol)")
            return doubleToString
        }
        return roundedString
    }
}
