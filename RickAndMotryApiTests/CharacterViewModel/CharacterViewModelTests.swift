//
//  CharacterViewModelTests.swift
//  RickAndMotryApiTests
//
//  Created by Andrew Ananda on 27/08/2024.
//

import XCTest
@testable import RickAndMotryApi

class CharacterViewModelTests: XCTestCase {
    
    var viewModel: CharacterViewModel!
    var mockNetworkService: CharacterRepositoryProtocol!
    
    override func setUp() {
        super.setUp()
        mockNetworkService = CharacterRepositoryMockup()
        viewModel = CharacterViewModel(repository: mockNetworkService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockNetworkService = nil
        super.tearDown()
    }
    
    func testFetchCharactersSuccess() {
       
        let expectation = XCTestExpectation(description: "Fetch characters")
        
        viewModel.onCharactersFetched = {
            XCTAssertEqual(self.viewModel.numberOfCharacters(), 1)
            XCTAssertEqual(self.viewModel.character(at: 0).name, "Adjudicator Rick")
            expectation.fulfill()
        }
        
        viewModel.fetchCharacters()
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchCharactersFailure() {
        let expectation = XCTestExpectation(description: "Fetch characters with error")
        
        
        viewModel.fetchCharacters()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertEqual(self.viewModel.numberOfCharacters(), 1)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
