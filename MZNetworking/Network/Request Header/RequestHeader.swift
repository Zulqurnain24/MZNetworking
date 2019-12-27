//
//  RequestHeader.swift
//  MZNetworking
//
//  Created by Mohammad Zulqarnain on 26/12/2019.
//  Copyright © 2019 Binary Leaf Ltd. All rights reserved.
//

import Foundation

/// Protocol for Netowrk Request header values for generic Request Modifier.
public protocol RequestHeader {
    var accept: String { get }
    var contentType: String { get }
}
