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
    
    
    var onCharactersFetched: (() -> Void)?
    var isLoading: ((_ : Bool) -> Void)?
    var errorResponse: ((_ : NetworkError) -> Void)?
    
    func fetchCharacters() {
        guard !isFetching else { return }
        isFetching = true
        isLoading?(true)
        
        
        NetworkService.shared.fetchCharacters(page: currentPage) { [weak self] result in
            guard let self = self else { return }
            self.isFetching = false
            self.isLoading?(false)
            
            switch result {
            case .success(let response):
                self.characters.append(contentsOf: response.results)
                self.currentPage += 1
                self.onCharactersFetched?()
            case .failure(let error):
                errorResponse?(error as? NetworkError ?? NetworkError.apiError(error.localizedDescription))
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
