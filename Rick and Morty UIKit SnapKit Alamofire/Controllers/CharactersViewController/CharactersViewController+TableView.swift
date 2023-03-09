//
//  CharacterViewController+TableView.swift
//  Rick and Morty UIKit SnapKit Alamofire
//
//  Created by Марк Голубев on 06.03.2023.
//

import UIKit

// MARK: - UITableViewDelegate, UITableViewDataSource
extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        self.table.delegate = self
        self.table.dataSource = self
        

        
        self.registerCell()
    }
    
    func registerCell() {
        table.register(CharacterTableCell.self, forCellReuseIdentifier: CharacterTableCell.identifier)
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableCell.identifier, for: indexPath) as? CharacterTableCell else { return UITableViewCell() }
        
        let cellViewModel = self.cellDataSource[indexPath.row]
        cell.setupCell(viewModel: cellViewModel)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let characterId = cellDataSource[indexPath.row].id
        self.openDetail(characterId: characterId)
        
    }
    
    
}
