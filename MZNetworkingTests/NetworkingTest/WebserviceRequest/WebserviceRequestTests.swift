//
//  WebserviceRequestTests.swift
//  MZNetworkingTests
//
//  Created by Mohammad Zulqarnain on 26/12/2019.
//  Copyright © 2019 Binary Leaf Pvt. Ltd. All rights reserved.
//

import Foundation
@testable import MZNetworking

final class RequestTest: JsonProvider {
    
    typealias Response = [PinItem]
    var uniqueIdentifier: String
    var url: String
    
    var endpoint: WebserviceRequestConvertible {
        
        return WebserviceRequestConverter(method: .get, path: url, name: "Testing Pin listing", requestUniqueIdentifier: uniqueIdentifier)
        
    }
    
    init(identifier: String, url: String) {
        self.uniqueIdentifier = identifier
        self.url = url
    }
}

