//
//  NetworkService.swift
//  RickAndMotryApi
//
//  Created by Andrew Ananda on 26/08/2024.
//

import Foundation


class NetworkService {
    static let shared = NetworkService()
    private var networkManager: NetworkManager?
    
    private init() {
        networkManager = NetworkManager()
    }
        
    func fetchCharacters(page: Int, filter: String = "", completion: @escaping (Result<CharacterResponse, Error>) -> Void) {
        
        var args = ""
        if filter != "" {
            args = "&status=\(filter)"
        }
        
        
        guard let url = URL(string: "\(K.Api.baseUrl)?page=\(page)\(args)") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        if !(networkManager?.isConnected ?? false) {
            completion(.failure(NetworkError.internetConnection))
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(NetworkError.apiError(error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                let httpError = NSError(domain: "InvalidResponse", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])
                completion(.failure(NetworkError.apiError(httpError.localizedDescription)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(CharacterResponse.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(NetworkError.apiError(error.localizedDescription)))
            }
        }
        task.resume()
    }
}


enum NetworkError: Error, Equatable {
    
    case apiError(String)
    case invalidURL
    case noData
    case internetConnection
    
    var message: String {
        switch self {
        case .apiError(let error):
            return error
        case .invalidURL:
            return K.Api.invaliedUrl
        case .noData:
            return K.Api.noDataError
        case .internetConnection:
            return K.Api.networkError
        }
    }
    
}
