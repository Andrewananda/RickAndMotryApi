//
//  CharacterRepository.swift
//  RickAndMotryApi
//
//  Created by Andrew Ananda on 27/08/2024.
//

import Foundation



class CharacterRepository : CharacterRepositoryProtocol {
    
    let networkService = NetworkService()
    
    
    func fetchCharacters(page: Int, filter: String, completion: @escaping (Result<CharacterResponse, NetworkError>) -> Void) {
        networkService.fetchCharacters(page: page, filter: filter) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error as? NetworkError ?? NetworkError.apiError(error.localizedDescription)))
            }
        }
    }
    
    
}
