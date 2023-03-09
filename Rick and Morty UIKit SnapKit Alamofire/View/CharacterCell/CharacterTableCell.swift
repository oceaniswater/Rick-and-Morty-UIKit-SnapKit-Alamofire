//
//  CharacterTableCell.swift
//  Rick and Morty UIKit SnapKit Alamofire
//
//  Created by Марк Голубев on 08.03.2023.
//

import UIKit
import SDWebImage

class CharacterTableCell: UITableViewCell {
    
    public static var identifier: String {
        get {
            return "CharacterTableCell"
        }
    }

    // MARK: - Init
    // Override init to add any views or setup constraints
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        inizialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: ColourConstant.shared.cellBackground)
        view.round(20)
        view.addBorder(color: UIColor(named: ColourConstant.shared.cellBoundBackground)!, width: 1)
        return view
    }()
    
    private let characterImage: UIImageView = {
        let image = UIImageView()
        image.round()
        image.addBorder(color: UIColor(named: ColourConstant.shared.cellBoundBackground)!, width: 1)
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(named: ColourConstant.shared.textColour)
        return label
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "gender:"
        label.textColor = UIColor(named: ColourConstant.shared.textColour)
        return label
    }()
    
    private let speciesLabel: UILabel = {
        let label = UILabel()
        label.text = "species:"
        label.textColor = UIColor(named: ColourConstant.shared.textColour)
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "location:"
        label.textColor = UIColor(named: ColourConstant.shared.textColour)
        return label
    }()
    
    private let genderValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: ColourConstant.shared.textColour)
        return label
    }()
    
    private let speciesValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: ColourConstant.shared.textColour)
        return label
    }()
    
    private let locationValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: ColourConstant.shared.textColour)
        label.numberOfLines = 0
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImage.image = nil
        nameLabel.text = nil
        genderValueLabel.text = nil
        speciesValueLabel.text = nil
        locationValueLabel.text = nil
    }
    
    // MARK: - Public methods
    func configure(with character: Character) {
        characterImage.image = UIImage(named: "test")
        nameLabel.text = character.name
        genderValueLabel.text = character.gender?.rawValue
        speciesValueLabel.text = character.species?.rawValue
        locationValueLabel.text = character.location?.name
    }
    
    func setupCell(viewModel: CharacterTableCellViewModel) {
        characterImage.sd_setImage(with: viewModel.imageUrl)
        nameLabel.text = viewModel.name
        genderValueLabel.text = viewModel.gender
        speciesValueLabel.text = viewModel.species
        locationValueLabel.text = viewModel.location
    }

}

extension CharacterTableCell {
    func inizialize() {
        backgroundColor = .clear
        
        addSubview(view)
        view.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(8)
        }
        
        
        view.addSubview(characterImage)
        characterImage.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.top.leading.equalToSuperview().inset(30)
        }
        
        let vLabelsStack = UIStackView(arrangedSubviews: [genderLabel, speciesLabel, locationLabel])
        vLabelsStack.axis = .vertical
        vLabelsStack.spacing = 5
        vLabelsStack.alignment = .leading
        
        let vLabelsValueStack = UIStackView(arrangedSubviews: [genderValueLabel, speciesValueLabel, locationValueLabel])
        vLabelsValueStack.axis = .vertical
        vLabelsValueStack.spacing = 5
        vLabelsValueStack.alignment = .leading
        
        let hInfoStack = UIStackView(arrangedSubviews: [vLabelsStack, vLabelsValueStack])
        hInfoStack.axis = .horizontal
        hInfoStack.spacing = 5
        hInfoStack.alignment = .leading
        
        let vFinalLabelsStack = UIStackView(arrangedSubviews: [nameLabel, hInfoStack])
        vFinalLabelsStack.axis = .vertical
        vFinalLabelsStack.spacing = 10
        
        
        view.addSubview(vFinalLabelsStack)
        vFinalLabelsStack.snp.makeConstraints { make in
            make.leading.equalTo(characterImage.snp.trailing).offset(5)
            make.trailing.equalToSuperview().inset(30)
            make.top.bottom.equalToSuperview().inset(30)
        }
    }
}
