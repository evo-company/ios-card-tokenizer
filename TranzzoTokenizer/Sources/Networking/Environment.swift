/*
* Copyright (c) TRANZZO LTD - All Rights Reserved
* Unauthorized copying of this file, via any medium is strictly prohibited
* Proprietary and confidential
*/

import Foundation
/// 
public enum Environment: String {
    case prod
    case stage
    
    // MARK: - Public Properties
    var baseURL: String {
        return scheme + "\(subdomain).\(domain)/\(groupPath)"
    }
    
    // MARK: - Private Properties
    private var scheme: String {
        return "https://"
    }
    
    private var subdomain: String {
        switch self {
        case .prod:
            return "widget"
        case .stage:
            return "widget-stg"
        }
    }
    
    private var domain: String {
        return "evopay.com.ua"
    }
    
    private var groupPath: String {
        return "api/v1/sdk/"
    }
}
