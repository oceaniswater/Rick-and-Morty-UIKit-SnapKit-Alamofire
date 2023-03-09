//
//  CharacterTableCellViewModelProtocol.swift
//  Rick and Morty UIKit SnapKit Alamofire
//
//  Created by Марк Голубев on 08.03.2023.
//

import Foundation

protocol CharacterTableCellViewModelProtocol {
    var id: Int { get set }
    var name: String { get set }
    var gender: String { get set }
    var species: String { get set }
    var location: String { get set }
    var imageUrl: URL? { get set }
}
