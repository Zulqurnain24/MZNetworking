//
//  SessionDataTaskModel.swift
//  MZNetworking
//
//  Created by Mohammad Zulqarnain on 26/12/2019.
//  Copyright © 2019 Binary Leaf Ltd. All rights reserved.
//

import Foundation

public struct SessionDataTaskModel {
    var dataTask: URLSessionDataTask
    var currentRequestCount: Int
    var completionHandlers: [String: completionHandler]
}
