//
//  WebserviceRequestConverter.swift
//  MZNetworking
//
//  Created by Mohammad Zulqarnain on 26/12/2019.
//  Copyright © 2019 Binary Leaf Ltd. All rights reserved.
//

import Foundation

/// HTTP Methods Enum
///
/// - get: To get data from server
/// - post: To post data to server
/// - put: To put data on server
/// - delete: To delete data from server
public enum HTTPMethod: String {
    case get
    case post
    case put
    case delete
}


public protocol WebserviceRequestConvertible {
    var name: String? {get}
    var Webservice: WebserviceRequest {get set}
    var numberOfRetry: Int {get}
    var method: HTTPMethod {get}
    var path: String {get}
    var timeout: TimeInterval? {get}
    var body: Data? {get}
    var requestUniqueIdentifier: String {get set}
    func urlRequest() -> URLRequest
    func updateURLRequest(header: RequestHeader) throws -> URLRequest
}

/// For  EndPoint information regarding Webservice Call.
public struct WebserviceRequestConverter: WebserviceRequestConvertible {
    /// Webservice Method required
    private(set) public var method: HTTPMethod
    /// Webservice Call URL
    private(set) public var path: String
    /// Webservice Timeout if custom. Default is set to 60.
    private(set) public var timeout: TimeInterval?
    /// Webservice Call Body
    private(set) public var body: Data?
    /// Webservice Call Name - used for Logging and identification purpose.
    private(set) public var name: String?
    /// Webservice Request used to set headers and details for Webservice.
    public var Webservice: WebserviceRequest
    /// To set number of retrys for any call if fails.
    private(set) public var numberOfRetry: Int
    /// Request unique identification for caching URL Request if same call arise.
    public var requestUniqueIdentifier: String
    
    /// For initializing Webservice Request Converter object.
    ///
    /// - Parameters:
    ///   - Webservice: Can set custom Webservice Request Value. - Default is set to PublicWebservice.
    ///   - method: Webservice HTTP Method, required to process Webservice Request.
    ///   - path: Webservice Call URL.
    ///   - timeout: Optional value, required to set timeout for Webservice Call.
    ///   - body: Webservice Call request Body.
    ///   - name: Webservice Call name.
    ///   - numberOfRetry: Number of retry for any Webservice call, if call fails.
    ///   - requestUniqueIdentifier: Unique identifier, to identify the caller.
    public init(Webservice: WebserviceRequest = .PublicWebservice,
                method: HTTPMethod,
                path: String,
                timeout: TimeInterval? = nil,
                body: Data? = nil,
                name: String,
                numberOfRetry: Int = 0,
                requestUniqueIdentifier: String = "") {
        
        self.Webservice = Webservice
        self.method = method
        self.path = path
        self.timeout = timeout
        self.body = body
        self.name = name
        self.numberOfRetry = numberOfRetry
        self.requestUniqueIdentifier = requestUniqueIdentifier
    }
    
    /// Returns URL created from Path provided by the user.
    private var url: URL {
        
        return URL(string: path)!
    }
    
    /// Used to set request Modifiers and headers to Webservice URL.
    ///
    /// - Parameter header: headers set by user for WebserviceRequest.
    /// - Returns: URL Request created from Webservice URL, Request header and request Modifiers.
    /// - Throws: If url request creation fails.
    public func updateURLRequest(header: RequestHeader) throws -> URLRequest {
        let modifiedEndpoint = try Webservice.requestModifiers
            .reduce(self) { try $1.modify(endpoint: $0, headers: header) }
        return modifiedEndpoint.urlRequest()
    }
    
    /// returns URLRequest based on the provided WebserviceRequest and headers.
    ///
    /// - Returns: URLRequest object created from URL and headers
    public func urlRequest() -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue.uppercased()
        
        if let body = body {
            request.httpBody = body
        }
        
        if let timeout = timeout {
            request.timeoutInterval = timeout
        }
        
        return request
    }
    
}

