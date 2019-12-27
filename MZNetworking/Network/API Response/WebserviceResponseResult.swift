//
//  WebserviceResponseResult.swift
//  MZNetworking
//
//  Created by Mohammad Zulqarnain on 26/12/2019.
//  Copyright © 2019 Binary Leaf Ltd. All rights reserved.
//

import Foundation

/// Enum returned as result for Webservice Network call Response in completionHandler
///
/// - success: Return generic type value If Success.
/// - failure: Return WebserviceResponseNetworkError If Failture.
public enum WebserviceResponseResult<V> {
    case success(V)
    case failure(WebserviceResponseNetworkError)
}
