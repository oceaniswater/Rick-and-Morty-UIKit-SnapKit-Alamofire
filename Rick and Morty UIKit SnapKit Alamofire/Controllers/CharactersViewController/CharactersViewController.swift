//
//  CharactersViewController.swift
//  Rick and Morty UIKit SnapKit Alamofire
//
//  Created by Марк Голубев on 06.03.2023.
//

import UIKit
import SnapKit

class CharactersViewController: UIViewController {
    
    //ViewModel
    var viewModel: CharactersViewModel = CharactersViewModel()
    
    //Variables
    var cellDataSource: [CharacterTableCellViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    let searchController: UISearchBar = {
        let search = UISearchBar()
        search.barTintColor = UIColor(named: ColourConstant.shared.appBackground)
        return search
    }()
    
    let table: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor(named: ColourConstant.shared.appBackground)
        table.separatorStyle = .none
        return table
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.color = UIColor(named: ColourConstant.shared.activityColour)
        return indicator
    }()
}

extension CharactersViewController {
    
    // MARK: - Initialize View
    
    func initialize() {
        title = "Characters"
        view.backgroundColor = UIColor(named: ColourConstant.shared.appBackground)
                
        searchController.delegate = self
        view.addSubview(searchController)
        
        searchController.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        setupTableView()
        view.addSubview(table)
        
        table.snp.makeConstraints { make in
            make.top.equalTo(searchController.snp.bottom)
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    // MARK: - Bind ViewModel
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else { return }
            
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.celDataSource.bind { [weak self] characters in
            guard let self = self, let characters = characters else { return }
            
            self.cellDataSource = characters
            self.reloadTableView()
        }
    }
    
    // MARK: - Navigation
    
    func openDetail(characterId: Int) {
        guard let character = viewModel.retriveCharacter(with: characterId) else { return }
        let detailViewModel = CharacterDetailViewModel(character: character)
        let detailController = CharacterDetailViewController(viewModel: detailViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailController, animated: true)
        }
    }
}
