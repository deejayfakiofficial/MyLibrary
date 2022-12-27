//
//  Array+Chunks.swift
//  
//
//  Created by Станислав Терентьев on 26.12.2022.
//

import Foundation

public extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
