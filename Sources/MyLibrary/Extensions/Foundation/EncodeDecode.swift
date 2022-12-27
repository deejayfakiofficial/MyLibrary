//
//  EncodeDecode.swift
//  
//
//  Created by Станислав Терентьев on 26.12.2022.
//

import Foundation

extension JSONDecoder {
    internal func decode<T>(_ type: T.Type, from json: Any) throws -> T where T: Decodable {
        let data = try JSONSerialization.data(withJSONObject: json, options: [])
        return try self.decode(type, from: data)
    }
}
