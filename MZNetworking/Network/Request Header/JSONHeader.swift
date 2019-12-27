//
//  JSONHeader.swift
//  MZNetworking
//
//  Created by Mohammad Zulqarnain on 26/12/2019.
//  Copyright © 2019 Binary Leaf Ltd. All rights reserved.
//

import Foundation

/// Provide JSON Network Request header values for generic Request Modifier.
final class JSONNetworkRepository: RequestHeader {
    let accept: String = "application/json"
    let contentType: String = "application/json"
}

