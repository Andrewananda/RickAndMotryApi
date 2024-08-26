//
//  CharacterViewModel.swift
//  RickAndMotryApi
//
//  Created by Andrew Ananda on 26/08/2024.
//

import Foundation


class CharacterViewModel {
    
    private var characters = [CharacterModel]()
    private var currentPage = 1
    private var isFetching = false
    private var repository: CharacterRepositoryProtocol
    
    
    
    var onCharactersFetched: (() -> Void)?
    var isLoading: ((_ : Bool) -> Void)?
    var errorResponse: ((_ : NetworkError) -> Void)?
    
    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchCharacters(filter: String = "", shouldClear: Bool = false) {
        guard !isFetching else { return }
        isFetching = true
        isLoading?(true)
        
        if !filter.isEmpty {
            if shouldClear {
                currentPage = 1
                characters.removeAll()
            }
        }
        
        repository.fetchCharacters(page: currentPage, filter: filter) { result in
            self.isFetching = false
            self.isLoading?(false)
            
            switch result {
            case .success(let response):
                self.characters.append(contentsOf: response.results)
                self.currentPage += 1
                self.onCharactersFetched?()
            case .failure(let error):
                self.errorResponse?(error)
            }
        }
        
        
        
    }
    
    func numberOfCharacters() -> Int {
        return characters.count
    }
    
    func character(at index: Int) -> CharacterModel {
        return characters[index]
    }
    
    func reset() {
        characters.removeAll()
        currentPage = 1
        fetchCharacters()
    }
}
