//
//  URLSessionManagerTests.swift
//  MZNetworkingTests
//
//  Created by Mohammad Zulqarnain on 26/12/2019.
//  Copyright © 2019 Binary Leaf Pvt. Ltd. All rights reserved.
//

import XCTest
@testable import MZNetworking

class URLSessionManagerTests: XCTestCase {
    
    let urlSessionManager = URLSessionManager.shared
    let request = WebserviceGetRequestTest()
    
    func testURLSessionManagerSingleRequestSetDataTask() {
        
        urlSessionManager.removeAllRequest()
        
        let urlRequest = request.endpoint.urlRequest()
        let dataTask = urlSessionManager.sessionManager.dataTask(with: urlRequest)
        
        urlSessionManager.set(dataTask, for: request.endpoint) { (_) in
        }
        
        let urlString = urlRequest.url?.absoluteString ?? ""
        XCTAssertNotNil(urlSessionManager.getDataTask(for: urlString))
        XCTAssertTrue(urlSessionManager.canCancelRequest(for: urlString))
        XCTAssertEqual(urlSessionManager.getCompletions(for: urlString).count, 1)
    }
    
    func testURLSessionManagerMultipleRequestSetDataTask() {
        
        let result = createMultipleRequest()
        let urlString = result.0.urlRequest().url?.absoluteString ?? ""
        
        XCTAssertNotNil(urlSessionManager.getDataTask(for: urlString))
        XCTAssertFalse(urlSessionManager.canCancelRequest(for: urlString))
        XCTAssertEqual(urlSessionManager.getCompletions(for: urlString).count, 2)
    }
    
    func createMultipleRequest() -> (WebserviceRequestConvertible,WebserviceRequestConvertible) {
        urlSessionManager.removeAllRequest()
        
        var endpointFirstRequest = request.endpoint
        endpointFirstRequest.requestUniqueIdentifier = "1"
        let urlRequestFirstRequest = endpointFirstRequest.urlRequest()
        
        var endpointSecondRequest = request.endpoint
        endpointSecondRequest.requestUniqueIdentifier = "2"
        let urlRequestSecondRequest = endpointSecondRequest.urlRequest()
        
        let urlString = urlRequestFirstRequest.url?.absoluteString ?? ""
        
        XCTAssertNil(urlSessionManager.getDataTask(for: urlString))
        
        let dataTask = urlSessionManager.sessionManager.dataTask(with: urlRequestFirstRequest)
        
        urlSessionManager.set(dataTask, for: endpointFirstRequest) { (_) in
        }
        
        urlSessionManager.set(dataTask, for: endpointSecondRequest) { (_) in
        }
        
        return (endpointFirstRequest, endpointSecondRequest)
    }
    
    func testCancelRequest() {
        let result = createMultipleRequest()
        let urlString = result.0.urlRequest().url?.absoluteString ?? ""
        
        XCTAssertFalse(urlSessionManager.canCancelRequest(for: urlString))
        XCTAssertEqual(urlSessionManager.getCompletions(for: urlString).count, 2)
        
        urlSessionManager.removeRequest(for: result.0)
        
        XCTAssertTrue(urlSessionManager.canCancelRequest(for: urlString))
        XCTAssertEqual(urlSessionManager.getCompletions(for: urlString).count, 1)
        
    }
}

