//
//  XMLHeader.swift
//  MZNetworking
//
//  Created by Mohammad Zulqarnain on 26/12/2019.
//  Copyright © 2019 Binary Leaf Ltd. All rights reserved.
//

import Foundation

/// Provide XML Network Request header values for generic Request Modifier.
final class XMLHeader: RequestHeader {
    let accept: String = "application/xml"
    let contentType: String = "application/xml"
}
