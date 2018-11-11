//
//  HTTPServiceTests.swift
//  NASA_ImagesTests
//
//  Created by Pete Holdsworth on 11/11/2018.
//  Copyright © 2018 Onyx Interactive. All rights reserved.
//

import XCTest
@testable import NASA_Images


class HTTPServiceTests: XCTestCase {
    
    var sessionUnderTest: URLSession!
    var httpServiceUnderTest: HTTPService!
    
    
    // This method instanciates new URLSession and HTTPService objects for each test
    override func setUp() {
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
        httpServiceUnderTest = HTTPService()
    }
        

    
    // Asynchronous test: faster fail
    func testCallToNASACompletes() {
        // given
        let url = URL(string: "https://images-api.nasa.gov/search?q=testingAPI")

        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        // when
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()

        waitForExpectations(timeout: 5, handler: nil)
        
        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    
    
    
    // This method destroys the HTTPService instance after each test is complete
    override func tearDown() {
        sessionUnderTest = nil
        httpServiceUnderTest = nil
    }



}

