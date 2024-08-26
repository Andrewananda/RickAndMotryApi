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
    }
    
    struct Color {
        static let listBorderBackgroundColor = "list_border_color"
        static let listItemCharacterNameColor = "ListItemCharacterNameColor"
        static let listItemSpeciesNameColor = "listItemSpeciesNameColor"
        static let themeBackground = "themeBackground"
    }
    
}
