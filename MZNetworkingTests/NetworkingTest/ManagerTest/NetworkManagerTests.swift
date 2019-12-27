//
//  NetworkManagerTests.swift
//  MZNetworkingTests
//
//  Created by Mohammad Zulqarnain on 26/12/2019.
//  Copyright © 2019 Binary Leaf Pvt. Ltd. All rights reserved.
//

import XCTest
@testable import MZNetworking

class NetworkManagerTests: XCTestCase {
    
    //MARK: - Test Success Case
    
    //Test proper data is proper map from Server and the model class
    func testSuccessJSONResponseFromServer() {
        
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [MockURLProtocol.self]
        let mockSession = URLSession(configuration: sessionConfiguration)
        
        let networkManger = NetworkManager()
        
        URLSessionManager.shared.sessionManager = mockSession
        
        let exp = self.expectation(description: "Webservice Call Wait Expectation")
        
        let request = RequestTest(identifier: "testSuccessResponseFromServer", url: "http://pastebin.com/raw/wgkJgazE")
        
        MockURLProtocol.requestHandler =  { request in
            return (nil, jsonWebserviceResponseSuccessStub ,nil)
        }
        
        networkManger.request(request) { (result) in
            if case let .success(data) = result {
                
                let result = WebserviceResponseResult.success(jsonWebserviceResponseSuccessStub)
                let pinItemsResult:WebserviceResponseResult<[PinItem]> = JSONTranslator().convertDataResponseModel(with: result)
                
                switch pinItemsResult {
                case .success(let pinItems):
                    XCTAssertEqual(data.count, pinItems.count)
                default:
                    break
                }
            }
            
            exp.fulfill()
        }
        waitForExpectations(timeout: 5.0) { (error) in
            print(error?.localizedDescription ?? "")
        }
        
        
    }
    
    //Test proper data is proper map from Server and the model class
    func testSuccessImageDownloadResponseFromServer() {
        
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [MockURLProtocol.self]
        let mockSession = URLSession(configuration: sessionConfiguration)
        
        let networkManger = NetworkManager()
        
        URLSessionManager.shared.sessionManager = mockSession
        
        let exp = self.expectation(description: "Webservice Call Wait Expectation")
        
        let request = WebserviceDownloadRequestTest(identifier: "testSuccessImageDownloadResponseFromServer", url: "https://images.unsplash.com/profile-1464495186405-68089dcd96c3?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=128&w=128&s=622a88097cf6661f84cd8942d851d9a2")
        
        MockURLProtocol.requestHandler =  { request in
            return (nil, imageDataStub ,nil)
        }
        
        networkManger.download(request) { (result) in
            if case let .success(data) = result {
                
                XCTAssertEqual(imageDataStub, data)
                
            }
            
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 5.0) { (error) in
            print(error?.localizedDescription ?? "")
        }
        
        
    }
    
    //MARK: - Test Failure Case
    
    //Test error  is mapping  from server and Model class
    func testInternetConnectionFailureResponseFromServer() {
        
        let error = WebserviceResponseNetworkError.internetOffline
        
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [MockURLProtocol.self]
        let mockSession = URLSession(configuration: sessionConfiguration)
        
        let networkManger = NetworkManager()
        
        URLSessionManager.shared.sessionManager = mockSession
        
        MockURLProtocol.requestHandler =  { request in
            return (nil, nil ,error)
        }
        
        let request = RequestTest(identifier: "testInternetConnectionFailureResponseFromServer", url: "http://pastebin.com")
        
        networkManger.request(request) { (result) in
            if case let .failure(error) = result {
                XCTAssertTrue(error.localizedDescription == "The operation couldn’t be completed. (MZNetworking.WebserviceResponseNetworkError error 1.)")
            }
            
        }
    }
    
    //Test error  is mapping  from server and Model class
    func testUnknownErrorFailureResponseFromServer() {
        
        
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        sessionConfiguration.protocolClasses = [MockURLProtocol.self]
        let mockSession = URLSession(configuration: sessionConfiguration)
        
        let networkManger = NetworkManager()
        URLSessionManager.shared.sessionManager = mockSession
        MockURLProtocol.requestHandler =  { request in
            return (nil, nil ,nil)
        }
        
        let request = RequestTest(identifier: "testUnknownErrorFailureResponseFromServer", url: "google.com")
        networkManger.request(request) { (result) in
            if case let .failure(error) = result {
                XCTAssertTrue(error.localizedDescription == "The operation couldn’t be completed. (MZNetworking.WebserviceResponseNetworkError error 1.)")
            }
        }
    }
    
    func testRequestCancel() {
        
        let request = RequestTest(identifier: "testRequestCancel", url: "yah.com")
        let networkManger = NetworkManager()
        let failureResponseFromServerExpectation = self.expectation(description: "testRequestCancel")
        
        networkManger.cancel(request.endpoint) { (isSuccess) in
            XCTAssertTrue(isSuccess)
            failureResponseFromServerExpectation.fulfill()
            
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    
}

