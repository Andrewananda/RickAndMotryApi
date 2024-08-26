//
//  NetworkServiceTests.swift
//  RickAndMotryApiTests
//
//  Created by Andrew Ananda on 27/08/2024.
//

import XCTest
@testable import RickAndMotryApi

class NetworkServiceTests: XCTestCase {
    
    var mockURLSession: MockURLSession!
    var networkService: NetworkService!
    var mockData: Data?
    var mockError: Error?
    
    override func setUp() {
        super.setUp()
        mockURLSession = MockURLSession()
        networkService = NetworkService()
    }
    
    override func tearDown() {
        mockURLSession = nil
        networkService = nil
        super.tearDown()
    }
    
    func testFetchCharactersSuccess() {
        mockURLSession.data = MockData.characterJSON
        let expectation = XCTestExpectation(description: "Fetch characters")
        
        networkService.fetchCharacters(page: 1) { result in
            switch result {
            case .success(let characterResponse):
                XCTAssertEqual(characterResponse.results.count, 20)
                XCTAssertEqual(characterResponse.results.first?.name, "Rick Sanchez")
            case .failure(let error):
                XCTFail("Expected success, but got \(error) instead")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchCharactersFailure() {
        mockURLSession.error = NSError(domain: "NetworkError", code: 0, userInfo: nil)
        let expectation = XCTestExpectation(description: "Fetch characters with error")
        
        networkService.fetchCharacters(page: 5000) { result in
            switch result {
            case .success:
                XCTFail("Expected failure, but got success instead")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
