//
//  EndpointTests.swift
//  MZNetworkingTests
//
//  Created by Mohammad Zulqarnain on 26/12/2019.
//  Copyright © 2019 Binary Leaf Pvt. Ltd. All rights reserved.
//

import XCTest
@testable import MZNetworking

class EndpointTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //MARK: - Http Method Mapping
    func testEndPointHttpMethodMapping() {
        
        let getRequestEndPoint = WebserviceGetRequestTest().endpoint
        let postRequestEndPoint = WebservicePostRequestTest().endpoint
        let putPutEndPoint = WebservicePutRequestTest().endpoint
        let deleteRequestEndPoint = WebserviceDeleteRequestTest().endpoint
        
        XCTAssertTrue(getRequestEndPoint.urlRequest().httpMethod == "GET","Should Return GET")
        XCTAssertTrue(postRequestEndPoint.urlRequest().httpMethod == "POST","Should Return POST")
        XCTAssertTrue(putPutEndPoint.urlRequest().httpMethod == "PUT","Should Return PUT")
        XCTAssertTrue(deleteRequestEndPoint.urlRequest().httpMethod == "DELETE","Should Return DELETE")
    }
    
    //MARK: - EndPoint Route Mapping
    func testEndPointHttpRouteMapping() {
        
        let endPoint = WebserviceGetRequestTest().endpoint
        XCTAssertTrue(endPoint.urlRequest().url?.absoluteString == "http://pastebin.com/raw/wgkJgazE","Should Return Current Route Mapping")
        
    }
}

