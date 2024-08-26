//
//  NetworkServiceMockup.swift
//  RickAndMotryApi
//
//  Created by Andrew Ananda on 27/08/2024.
//

import Foundation


class NetworkServiceMockup: NetworkServiceDataSourceProtocol {
    
    func fetchCharacters(page: Int, filter: String, completion: @escaping (Result<CharacterResponse, any Error>) -> Void) {
        
    }
    
    
}
