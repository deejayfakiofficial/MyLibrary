//
//  Double+Price.swift
//  
//
//  Created by Станислав Терентьев on 26.12.2022.
//

import Foundation

public extension Double {
    
    func getStringifiedPrice() -> String? {
        let formatterFloatingDigits = floor(Double(truncating: NSNumber(value: self))) == Double(truncating: NSNumber(value: self)) ? 0 : 2
        let formatter = NumberFormatter()
        var strigifiedPrice: String?
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.numberStyle = .currency
        formatter.allowsFloats = false
        formatter.generatesDecimalNumbers = false
        formatter.maximumFractionDigits = formatterFloatingDigits
        if let formattedTipAmount = formatter.string(from: NSNumber(value: self)) {
            strigifiedPrice = formattedTipAmount
        }
        return strigifiedPrice
    }
}
