//
//  WebserviceResponseNetworkError.swift
//  MZNetworking
//
//  Created by Mohammad Zulqarnain on 26/12/2019.
//  Copyright © 2019 Binary Leaf Ltd. All rights reserved.
//

import Foundation

/// Network Error Enum
///
/// - internetOffline: For No internnet connection
/// - requestCreation: If there is something wrong with the network request or URL
/// - decoding: When there is some issue with the decoding of archived data
/// - server: For server error
/// - error: Call received error
/// - unknown: Undefined error
public enum WebserviceResponseNetworkError: Error {
    case internetOffline
    case requestCreation
    case decoding(Data, Error)
    case server(Error)
    case unknown
    
    /// Error Description.
    var message: String {
        switch self {
        case .internetOffline:
            return "The Internet connection appears to be offline."
        case .requestCreation:
            return "Request could not be created."
        case .decoding(_, let error):
            return "Decoding failed: \(error.localizedDescription)"
        case .server(let error):
            return error.localizedDescription
        case .unknown:
            return "Unknown error."
        }
    }
    
    /// Error code
    var errorCode: Int {
        switch self {
        case .internetOffline:
            return -1009
        default:
            return 500
        }
    }
}
