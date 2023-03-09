//
//  CharacterDetailViewModelProtocol.swift
//  Rick and Morty UIKit SnapKit Alamofire
//
//  Created by Марк Голубев on 08.03.2023.
//

import Foundation

protocol CharacterDetailViewModelProtocol {
    var character: Character { get set }
    var id: Int { get set }
    var imageUrl: URL? { get set }
    var name: String { get set }
    var status: Status { get set }
    var isAlive: Bool { get set }
    var species: String { get set }
    
    
}
