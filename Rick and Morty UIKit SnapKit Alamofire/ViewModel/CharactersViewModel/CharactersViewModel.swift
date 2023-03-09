//
//  CharactersViewModel.swift
//  Rick and Morty UIKit SnapKit Alamofire
//
//  Created by Марк Голубев on 06.03.2023.
//

import Foundation

class CharactersViewModel: CharacterViewModelProtocol {
    
    var celDataSource: Observable<[CharacterTableCellViewModel]> = Observable(nil)
    var isLoading: Observable<Bool> = Observable(false)
    var dataSourse: AllCharactersModel?
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        APICaller.getCharacters { [weak self] result in
            self?.isLoading.value = false
            
            switch result {
            case .success(let data):
                self?.dataSourse = data
                self?.mapCellData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func mapCellData() {
        self.celDataSource.value = self.dataSourse?.results?.compactMap({ CharacterTableCellViewModel(character: $0)
        })
    }
    
    func retriveCharacter( with id: Int) -> Character? {
        guard let character = dataSourse?.results?.first(where: {$0.id == id}) else { return nil }
        return character
    }
    
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSourse?.results?.count ?? 0
    }
    
    
}
