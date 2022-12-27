//
//  Locale+PrefferedLanguage.swift
//  
//
//  Created by Станислав Терентьев on 26.12.2022.
//

import Foundation

extension Locale {

    public static var preferred: Locale {
        guard let preferredIdentifier = Locale.preferredLanguages.first else {
            return .current
        }
        return Locale(identifier: preferredIdentifier)
    }

}
