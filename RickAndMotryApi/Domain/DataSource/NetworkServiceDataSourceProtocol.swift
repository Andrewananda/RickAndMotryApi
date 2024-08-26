//
//  NetworkServiceDataSourceProtocol.swift
//  RickAndMotryApi
//
//  Created by Andrew Ananda on 27/08/2024.
//

import Foundation



protocol NetworkServiceDataSourceProtocol {
    
    func fetchCharacters(page: Int, filter: String, completion: @escaping (Result<CharacterResponse, Error>) -> Void)
    
}
