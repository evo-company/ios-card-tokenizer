/*
* Copyright (c) TRANZZO LTD - All Rights Reserved
* Unauthorized copying of this file, via any medium is strictly prohibited
* Proprietary and confidential
*/

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum RequestData {
    case tokenize(card: CardRequestData)
    
    var path: String {
        switch self {
        case .tokenize:
            return "tokenize"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .tokenize:
            return .post
        }
    }
}
