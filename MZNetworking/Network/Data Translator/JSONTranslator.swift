//
//  JSONTranslator.swift
//  MZNetworking
//
//  Created by Mohammad Zulqarnain on 26/12/2019.
//  Copyright © 2019 Binary Leaf Ltd. All rights reserved.
//

import Foundation

/// Protocol for translating the data from JSON to response
public protocol JSONTranslatable {
    func convertDataResponseModel<T>(with response: WebserviceResponseResult<Data>) -> WebserviceResponseResult<T> where T: Decodable
}

/// Converting the received data from JSON to Generic Response Type
/// Response Type must be provided and should confirm to Codable protocol
public class JSONTranslator: JSONTranslatable {
    
    public init() {}
    
    /// Convert the Data received from server in JSON format to Codable Confirmed Response DataType
    ///
    /// - Parameter Response: The response Data received from network call.
    /// - Returns: WebserviceResponseResult contains:
    ///   Success If Decoder successfully converts JSON data to Response DataType.
    ///   Failure with decoding error, If conversion fails or received Network request error
    public func convertDataResponseModel<T>(with response: WebserviceResponseResult<Data>) -> WebserviceResponseResult<T> where T: Decodable {
        switch response {
        case .success(let data):
            do {
                return .success(try JSONDecoder().decode(T.self, from: data))
            }
            catch {
                return  .failure(WebserviceResponseNetworkError.decoding(data, error))
            }
            
        case .failure(let error):
            return .failure(WebserviceResponseNetworkError.server(error))
        }
    }
}

