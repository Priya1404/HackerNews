//
//  PlayoSearchWorkerUnitTests.swift
//  PlayoHackerNewsTests
//
//  Created by Priya Srivastava on 12/09/21.
//

import XCTest
@testable import PlayoHackerNews

class SearchWorkerUnitTests: XCTestCase {
    
    var searchServiceSut: SearchWorker!
    var expec = XCTestExpectation(description: "FetchList")

    override func setUpWithError() throws {
        searchServiceSut = SearchWorker()
    }

    override func tearDownWithError() throws {
        searchServiceSut = nil
    }

    func testSearchWorkerAPICall() throws {
        searchServiceSut.searchForNews(withText: "Sports", pageNumber: 0) { [weak self] (result) in
            if let list = result.hits, list.count > 0 {
                self?.expec.fulfill()
                XCTAssert(true, "List of Search Results found")
            }
        } failure: { (error) in
            XCTFail(error.localizedDescription)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
