/*
* Copyright (c) TRANZZO LTD - All Rights Reserved
* Unauthorized copying of this file, via any medium is strictly prohibited
* Proprietary and confidential
*/

import Foundation

final class DataEncoder: JSONEncoder {
    override init() {
        super.init()
        keyEncodingStrategy = .convertToSnakeCase
    }
    
    func stringEncode<T: Encodable>(_ object: T) -> String? {
        if
            let encodedData = try? encode(object),
            let dictionary = try? JSONSerialization.jsonObject(with: encodedData, options: .allowFragments) {
            
            return (dictionary as? [String: Any])?
                .sorted { $0.key < $1.key }
                .map { (key, value) in
                    if let nsValue = value as? NSNumber, nsValue.isBool {
                        return "\(Bool(truncating: nsValue))"
                    }
                    return "\(value)" }
                .joined(separator: "")
        }
        return nil
    }
}
