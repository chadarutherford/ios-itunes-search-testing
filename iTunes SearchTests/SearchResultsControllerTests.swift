//
//  SearchResultsControllerTests.swift
//  iTunes SearchTests
//
//  Created by Chad Rutherford on 1/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import iTunes_Search

class SearchResultsControllerTests: XCTestCase {
    
    func testPerformSearch() {
        let controller = SearchResultController()
        let exp = expectation(description: "Wait for iTunes API to return")
        
        controller.performSearch(for: "Garage Band", resultType: .software) {
            XCTAssert(!controller.searchResults.isEmpty)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 3)
        XCTAssertTrue(controller.searchResults.count > 0, "Expecting at least one result for \"Garage Band\" from API")
    }
    
    func testSearchResultController() {
        let mock = MockLoader()
        mock.data = goodResultData
        
        let controller = SearchResultController(networkLoader: mock)
        let exp = expectation(description: "Wait for iTunes API to return")
        
        controller.performSearch(for: "GarageBand", resultType: .software) {
            XCTAssert(!controller.searchResults.isEmpty)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
        XCTAssertTrue(controller.searchResults.count > 0, "Expecting 2 results for GarageBand")
        XCTAssertEqual(controller.searchResults[0].title, "GarageBand")
        XCTAssertEqual(controller.searchResults[0].artist, "Apple")
    }
    
    func testBadJSONDecodingReturnsError() {
        let mock = MockLoader()
        mock.data = badResultData
        
        let controller = SearchResultController(networkLoader: mock)
        let exp = expectation(description: "Wait for iTunes API to return")
        
        controller.performSearch(for: "GarageBand", resultType: .software) {
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
        
        XCTAssertTrue(controller.searchResults.isEmpty)
        XCTAssertNotNil(controller.error)
    }
    
    func testNoResultsData() {
        let mock = MockLoader()
        mock.data = noResultsData
        
        let controller = SearchResultController(networkLoader: mock)
        let exp = expectation(description: "Wait for iTunes API to return")
        
        controller.performSearch(for: "abcdefg1234", resultType: .software) {
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 2)
        
        XCTAssert(controller.searchResults.isEmpty)
        XCTAssertNil(controller.error)
    }
}
