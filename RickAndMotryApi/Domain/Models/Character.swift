//
//  Character.swift
//  RickAndMotryApi
//
//  Created by Andrew Ananda on 26/08/2024.
//

import Foundation

struct CharacterModel: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
    let origin: CharacterOrigin
}

struct CharacterResponse: Codable {
    let results: [CharacterModel]
    let info: Info
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}


struct CharacterOrigin: Codable {
    let name: String?
    let url: String?
    
}
