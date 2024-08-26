//
//  CharacterTableViewCell.swift
//  RickAndMotryApi
//
//  Created by Andrew Ananda on 26/08/2024.
//

import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = K.TableViewCell.characterCellIdentifier
    
    private let backgroundColors: [UIColor] = [
        UIColor.systemBackground,
        UIColor.systemBlue.withAlphaComponent(0.1),
        UIColor.systemPink.withAlphaComponent(0.1)
    ]

    // MARK: - UI Components
    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor(named: K.Color.listItemCharacterNameColor)
        return label
    }()
    
    let speciesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(named: K.Color.listItemSpeciesNameColor)
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(characterImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(speciesLabel)
        self.selectionStyle = .none
        
        // Set constraints
        containerView.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 12
        containerView.layer.borderColor = UIColor(named: K.Color.listBorderBackgroundColor)?.cgColor
        
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            characterImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            characterImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            characterImageView.widthAnchor.constraint(equalToConstant: 70),
            characterImageView.heightAnchor.constraint(equalToConstant: 70),
            
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 22),
            
            speciesLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            speciesLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            speciesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
        ])
    }
    
    // MARK: - Configure Cell
    func configure(with character: CharacterModel) {
        characterImageView.kf.setImage(with: URL(string: character.image))
        nameLabel.text = character.name
        speciesLabel.text = character.species
        containerView.backgroundColor = backgroundColors.randomElement()
    }
}
