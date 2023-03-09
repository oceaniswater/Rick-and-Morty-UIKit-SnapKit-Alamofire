//
//  CharacterDetailViewModel.swift
//  Rick and Morty UIKit SnapKit Alamofire
//
//  Created by Марк Голубев on 08.03.2023.
//

import Foundation

class CharacterDetailViewModel: CharacterDetailViewModelProtocol {
    var id: Int
    
    var character: Character
    
    var imageUrl: URL?
    
    var name: String
    
    var status: Status
    
    var isAlive: Bool
    
    var species: String
    
    init(character: Character) {
        self.character = character
        self.id = character.id ?? 1
        self.imageUrl = URL(string: character.image ?? "")
        self.name = character.name ?? ""
        self.status = character.status ?? .unknown
        self.species = character.species?.rawValue ?? ""
        
        switch status {
        case .dead :
            self.isAlive = false
        default:
            self.isAlive = true
        }
    }
    
    
    
}
