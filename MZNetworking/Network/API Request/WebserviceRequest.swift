//
//  WebserviceRequest.swift
//  MZNetworking
//
//  Created by Mohammad Zulqarnain on 26/12/2019.
//  Copyright © 2019 Binary Leaf Ltd. All rights reserved.
//

import Foundation

/// Struct Containing information regarding  Webservice Call.
public struct WebserviceRequest {
    let path: String
    let headers: [String: String?]
    let requestModifiers: [RequestModifier]
    var additionalHeaders: [String: String?]
    
    /// Initializer for creating  Webservice Request.
    ///
    /// - Parameters:
    ///   - path: The url for  Webservic call (for instance "https://yopmail.com")
    ///   - headers: Used to provide headers required for Webservice call.
    ///   - requestModifiers: Used to provide request information regarding content-type, accept etc.
    ///   - additionalHeaders: Used to set additional headers if any.
    public init(path: String = "", headers: [String: String?] = [:], requestModifiers: [RequestModifier] = [], additionalHeaders: [String: String?] = [:]) {
        self.path = path
        self.headers = headers
        self.requestModifiers = requestModifiers
        self.additionalHeaders = additionalHeaders
    }
}


public extension  WebserviceRequest {
    /// Short hand method used to create public Webservice with generic Request Modifiers.
    static var PublicWebservice:  WebserviceRequest {
        return WebserviceRequest(requestModifiers: [GenericRequestModifier()])
    }
}
