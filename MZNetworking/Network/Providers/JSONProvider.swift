//
//  JSONProvider.swift
//  MZNetworking
//
//  Created by Mohammad Zulqarnain on 26/12/2019.
//  Copyright © 2019 Binary Leaf Ltd. All rights reserved.
//

import Foundation

/// JsonProvider for Json request, Used when Provider associatedType confirms Codable.
public protocol JsonProvider : Provider where Response: Codable {
    
}

