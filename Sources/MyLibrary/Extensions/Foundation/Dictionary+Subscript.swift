//
//  Dictionary+Subscript.swift
//  
//
//  Created by Станислав Терентьев on 26.12.2022.
//

public extension Dictionary {
    
    subscript(i: Int) -> (key: Key, value: Value) {
        return self[index(startIndex, offsetBy: i)]
    }
}
