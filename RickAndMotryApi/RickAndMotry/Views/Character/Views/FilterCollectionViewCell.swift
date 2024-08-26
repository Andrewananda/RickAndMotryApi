//
//  FilterCollectionViewCell.swift
//  RickAndMotryApi
//
//  Created by Andrew Ananda on 26/08/2024.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    static let identifier = K.TableViewCell.filterCollectionViewCell

    let filterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .center
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(named: K.Color.listBorderBackgroundColor)?.cgColor
        label.layer.cornerRadius = 12
        label.clipsToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(filterLabel)
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            filterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            filterLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            filterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with filter: String, isSelected: Bool) {
        filterLabel.text = filter
        filterLabel.backgroundColor = isSelected ? UIColor(named: K.Color.themeBackground) : UIColor.systemBackground
        filterLabel.textColor = isSelected ? .white : UIColor.label
    }
}
