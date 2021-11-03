/*
* Copyright (c) TRANZZO LTD - All Rights Reserved
* Unauthorized copying of this file, via any medium is strictly prohibited
* Proprietary and confidential
*/

import Foundation

public struct TranzzoTokenError: Error, Decodable {
    enum CodingKeys: String, CodingKey {
      case id
      case hint
      case message = "errorMessage"
    }
    
    public var id: String?
    public var hint: String?
    public var message: String?
    
    public init(message: String) {
        self.message = message
    }
}
