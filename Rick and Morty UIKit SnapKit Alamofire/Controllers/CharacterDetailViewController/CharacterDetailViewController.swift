//
//  CharacterDetailViewController.swift
//  Rick and Morty UIKit SnapKit Alamofire
//
//  Created by Марк Голубев on 08.03.2023.
//

import UIKit
import SnapKit
import SDWebImage

class CharacterDetailViewController: UIViewController {
    
    var viewModel: CharacterDetailViewModel
    
    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
        configView()
    }

    // MARK: - Private properties
    private let characterPhotoImageView: UIImageView = {
        let image = UIImageView()
        image.round()
        return image
    }()
    
    private let terminaredStampImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "terminated")
        image.isHidden = true
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: ColourConstant.shared.textColour)
        label.font = UIFont.systemFont(ofSize: 40)
        return label
    }()
    
    private let speciesLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: ColourConstant.shared.textColour)
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    

}

extension CharacterDetailViewController {
    
    // MARK: - Initialize view
    func initialize() {
        view.backgroundColor = UIColor(named: ColourConstant.shared.appBackground)
        
        view.addSubview(characterPhotoImageView)
        
        characterPhotoImageView.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
        characterPhotoImageView.addSubview(terminaredStampImageView)
        terminaredStampImageView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(10)
        }
        
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(characterPhotoImageView.snp.bottom).offset(10)
        }
        
        view.addSubview(speciesLabel)
        speciesLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        
    }
    
    // MARK: - Configure View
    func configView() {
        nameLabel.text = viewModel.name
        speciesLabel.text = viewModel.species
        characterPhotoImageView.sd_setImage(with: viewModel.imageUrl)
        terminaredStampImageView.isHidden = viewModel.isAlive ? true : false
        
    }
}
