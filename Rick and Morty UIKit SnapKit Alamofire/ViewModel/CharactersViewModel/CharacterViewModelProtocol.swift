//
//  CharacterViewModelProtocol.swift
//  Rick and Morty UIKit SnapKit Alamofire
//
//  Created by Марк Голубев on 06.03.2023.
//

import Foundation

protocol CharacterViewModelProtocol {
    
    var celDataSource: Observable<[CharacterTableCellViewModel]> { get set }
    var isLoading: Observable<Bool> { get set }
    var dataSourse: AllCharactersModel?  { get set }

    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func getData()
    func mapCellData()
}
