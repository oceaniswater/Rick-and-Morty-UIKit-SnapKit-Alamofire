//
//  CharacterTableCellViewModel.swift
//  Rick and Morty UIKit SnapKit Alamofire
//
//  Created by Марк Голубев on 08.03.2023.
//

import Foundation

class CharacterTableCellViewModel: CharacterTableCellViewModelProtocol {
    var id: Int
    
    var name: String
    
    var gender: String
    
    var species: String
    
    var location: String
    
    var imageUrl: URL?
    
    init(character: Character) {
        self.id = character.id ?? 1
        self.name = character.name ?? "No name"
        self.gender = character.gender?.rawValue ?? "No gender"
        self.species = character.species?.rawValue ?? "No species"
        self.location = character.location?.name ?? "No location"
        self.imageUrl = URL(string: character.image ?? "" )
    }
    
    
    
    
}
