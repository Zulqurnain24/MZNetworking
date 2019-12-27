//
//  WebservicePutRequestTest.swift
//  MZNetworkingTests
//
//  Created by Mohammad Zulqarnain on 26/12/2019.
//  Copyright © 2019 Binary Leaf Pvt. Ltd. All rights reserved.
//

import Foundation
@testable import MZNetworking

final class WebservicePutRequestTest: JsonProvider {
    
    typealias Response = [PinItem]
    
    var endpoint: WebserviceRequestConvertible {
        
        return WebserviceRequestConverter(method: .put, path: "http://pastebin.com/raw/wgkJgazE", name: "Testing Put Request")
        
    }
}
