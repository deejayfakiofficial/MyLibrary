//
//  Float+Currency.swift
//  
//
//  Created by Станислав Терентьев on 26.12.2022.
//

import Foundation

public extension Float {
    
    func formatToCurrency() -> String? {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.groupingSeparator = " "
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "ru-RU")//Locale.current
        currencyFormatter.maximumFractionDigits = 2
        return currencyFormatter.string(from: self as NSNumber)
    }
}
