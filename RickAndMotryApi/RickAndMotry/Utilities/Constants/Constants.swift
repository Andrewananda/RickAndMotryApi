//
//  Constants.swift
//  RickAndMotryApi
//
//  Created by Andrew Ananda on 26/08/2024.
//

import Foundation



struct K {
    
    struct TableViewCell {
        static let characterCellIdentifier = "CharacterTableViewCell"
        static let filterCollectionViewCell = "FilterCollectionViewCell"
    }
    
    struct Api {
        static var networkError = "No internet connection"
        static var noDataError = "Data not found"
        static var invaliedUrl = "Invalied URL"
        static var baseUrl = "https://rickandmortyapi.com/api/character/"
        
        static let characterJSON = """
        {
            "results": [
                {
                            "id": 8,
                            "name": "Adjudicator Rick",
                            "status": "Dead",
                            "species": "Human",
                            "type": "",
                            "gender": "Male",
                            "origin": {
                                "name": "unknown",
                                "url": ""
                            },
                            "location": {
                                "name": "Citadel of Ricks",
                                "url": "https://rickandmortyapi.com/api/location/3"
                            },
                            "image": "https://rickandmortyapi.com/api/character/avatar/8.jpeg",
                            "episode": [
                                "https://rickandmortyapi.com/api/episode/28"
                            ],
                            "url": "https://rickandmortyapi.com/api/character/8",
                            "created": "2017-11-04T20:03:34.737Z"
                }
            ],
            "info": {
                "count": 1,
                "pages": 1,
                "next": null,
                "prev": null
            }
        }
        """.data(using: .utf8)!
        
    }
    
    struct Color {
        static let listBorderBackgroundColor = "list_border_color"
        static let listItemCharacterNameColor = "ListItemCharacterNameColor"
        static let listItemSpeciesNameColor = "listItemSpeciesNameColor"
        static let themeBackground = "themeBackground"
    }
    
}
