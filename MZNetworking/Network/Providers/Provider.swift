//
//  Provider.swift
//  MZNetworking
//
//  Created by Mohammad Zulqarnain on 26/12/2019.
//  Copyright © 2019 Binary Leaf Ltd. All rights reserved.
//

import Foundation

/// Protocol For request Provider used to define to Type of response object.
public protocol Provider {
    
    /// AssociatedType for Response object
    associatedtype Response
    /// Used to define URL Request endpoint for Network manager.
    var endpoint: WebserviceRequestConvertible { get }
}
