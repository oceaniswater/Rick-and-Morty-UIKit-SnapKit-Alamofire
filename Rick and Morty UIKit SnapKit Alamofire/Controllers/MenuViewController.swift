//
//  ViewController.swift
//  Rick and Morty UIKit SnapKit Alamofire
//
//  Created by Марк Голубев on 03.03.2023.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    // MARK: - Private properties
    
//    private let titleLabel: UILabel = {
//        let title = UILabel()
//        title.text = "The Rick and Morty"
//        title.textColor = .orange
//        title.backgroundColor = .black
//        title.font = UIFont.systemFont(ofSize: 40)
//        return title
//    }()
    
    private let charactersButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Characters", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.setTitleColor(UIColor(named: ColourConstant.shared.textColour), for: .normal)
        
        button.addTarget(self, action: #selector(charactersButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let locationsButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Locations", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.setTitleColor(UIColor(named: ColourConstant.shared.textColour), for: .normal)
        button.addTarget(self, action: #selector(locationsButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let episodesButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Episodes", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.setTitleColor(UIColor(named: ColourConstant.shared.textColour), for: .normal)
        button.addTarget(self, action: #selector(episodesButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Private func
    
    @objc private func charactersButtonPressed() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.charactersButton.backgroundColor = UIColor(named: ColourConstant.shared.selectedButtonBackground)
        })
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.charactersButton.backgroundColor = .clear
        })
        let charactersVC = CharactersViewController()
        navigationController?.pushViewController(charactersVC, animated: true)

    }
    
    @objc private func locationsButtonPressed() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.locationsButton.backgroundColor = UIColor(named: ColourConstant.shared.selectedButtonBackground)
        })
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.locationsButton.backgroundColor = .clear
        })

    }
    
    @objc private func episodesButtonPressed() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.episodesButton.backgroundColor = UIColor(named: ColourConstant.shared.selectedButtonBackground)
        })
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.episodesButton.backgroundColor = .clear
        })

    }
}

extension MenuViewController {
    func initialize() {
        guard let navBar = navigationController?.navigationBar else { return }
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: ColourConstant.shared.appBackground)

        let attributes = [NSAttributedString.Key.foregroundColor: UIColor(named: ColourConstant.shared.titleColour),
                          NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 36)]
        appearance.largeTitleTextAttributes = attributes as [NSAttributedString.Key : Any]
        
        navBar.standardAppearance = appearance
        navBar.scrollEdgeAppearance = appearance
        
        navBar.prefersLargeTitles = true

        navigationItem.backButtonTitle = "Back"

        title = "The Rick and Morty"
        
        view.backgroundColor = UIColor(named: ColourConstant.shared.appBackground)
        
//        view.addSubview(titleLabel)
//
//        titleLabel.snp.makeConstraints { make in
//            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
//            make.top.equalTo(view.safeAreaLayoutGuide)
//            make.height.equalTo(50)
//        }
        
        episodesButton.snp.makeConstraints { make in

            make.height.equalTo(50)

        }
        
        locationsButton.snp.makeConstraints { make in
            make.height.equalTo(50)

        }
        
        charactersButton.snp.makeConstraints { make in
            make.height.equalTo(50)

        }
        
        let vStack = UIStackView(arrangedSubviews: [charactersButton, locationsButton, episodesButton])
        vStack.axis = .vertical
        vStack.spacing = 10
        
        view.addSubview(vStack)
        
        vStack.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
    }
}

