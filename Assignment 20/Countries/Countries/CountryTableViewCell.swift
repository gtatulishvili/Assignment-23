//
//  CountryTableViewCell.swift
//  Countries
//
//  Created by Gega on 4/21/24.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    let flagImageView = UIImageView()
    let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(flagImageView)
        contentView.addSubview(nameLabel)

        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([
            flagImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            flagImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            flagImageView.widthAnchor.constraint(equalToConstant: 50),
            flagImageView.heightAnchor.constraint(equalToConstant: 30),

            nameLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    
    func configure(with country: Country) {
        nameLabel.text = country.name.common
        
        DispatchQueue.global().async {
            if let url = URL(string: country.flags.png), let imageData = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.flagImageView.image = UIImage(data: imageData)
                }
            }
        }
    }

}
