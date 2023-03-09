//
//  CharactersViewController+SearchBar.swift
//  Rick and Morty UIKit SnapKit Alamofire
//
//  Created by Марк Голубев on 06.03.2023.
//

import UIKit


// MARK: - UISearchBarDelegate
extension CharactersViewController: UISearchBarDelegate {
    // filter data when you presed search
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        items = items?.filter(containsTitlePredicate, searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: false)
//        tableView.reloadData()
    }
    
    // use this method to update(filter) table when you type the text and refresh when delete all of symbols
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text?.count == 0 {
//            loadItems()
//        } else {
//            items = items?.filter(containsTitlePredicate, searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: false)
//            tableView.reloadData()
//        }
    }
    
    // refresh table when you pressed cancel button
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        loadItems()
//        DispatchQueue.main.async {
//            searchBar.resignFirstResponder()
//        }
        
    }
}



