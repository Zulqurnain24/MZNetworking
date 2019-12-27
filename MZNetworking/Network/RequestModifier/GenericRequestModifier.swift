//
//  GenericRequestModifier.swift
//  MZNetworking
//
//  Created by Mohammad Zulqarnain on 26/12/2019.
//  Copyright © 2019 Binary Leaf Ltd. All rights reserved.
//

import Foundation

final class GenericRequestModifier: RequestModifier {
    
    /// Used to create generic Public Request Modifier.
    ///
    /// - Parameters:
    ///   - endpoint: Used to add headers to endpoint
    ///   - headers: Add headers against Public request modifiers.
    /// - Returns: WebserviceRequestConvertible with added headers value.
    func modify(endpoint: WebserviceRequestConvertible, headers: RequestHeader) -> WebserviceRequestConvertible {
        if var requestConverter = endpoint as? WebserviceRequestConverter {
            ["accept": headers.accept,
             "content-type": headers.contentType].forEach { requestConverter.Webservice.additionalHeaders[$0.key] = $0.value }
            return requestConverter
        }
        return endpoint
    }
}
