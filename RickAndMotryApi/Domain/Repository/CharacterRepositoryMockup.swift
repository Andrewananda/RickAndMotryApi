//
//  CharacterRepositoryMockup.swift
//  RickAndMotryApi
//
//  Created by Andrew Ananda on 27/08/2024.
//

import Foundation


class CharacterRepositoryMockup: CharacterRepositoryProtocol {
    
    func fetchCharacters(page: Int, filter: String, completion: @escaping (Result<CharacterResponse, NetworkError>) -> Void) {
        
        do {
            var decoder = JSONDecoder()
            let data = try decoder.decode(CharacterResponse.self, from: K.Api.characterJSON)
            completion(.success(data))
        } catch {
            completion(.failure(NetworkError.apiError(error.localizedDescription)))
        }
        
        
    }
    
    
    
    
}
