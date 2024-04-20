//
//  NewsTableViewCell.swift
//  NewsAPP
//
//  Created by Gega on 4/19/24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let articleImageView = UIImageView()
    let descriptionLabel = UILabel()
    let timeLabel = UILabel()
    let overlayView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
    
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        contentView.addSubview(titleLabel)
        
        articleImageView.translatesAutoresizingMaskIntoConstraints = false
        articleImageView.contentMode = .scaleAspectFill
        articleImageView.clipsToBounds = true
        contentView.addSubview(articleImageView)
        
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        articleImageView.addSubview(overlayView)

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        overlayView.addSubview(descriptionLabel)

        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.textColor = .white
        overlayView.addSubview(timeLabel)

        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),

            articleImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            articleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            articleImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            articleImageView.heightAnchor.constraint(equalToConstant: 200),
            articleImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            overlayView.leadingAnchor.constraint(equalTo: articleImageView.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: articleImageView.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: articleImageView.bottomAnchor),
            overlayView.heightAnchor.constraint(equalToConstant: 60), // Adjust the height as needed

            descriptionLabel.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: -10),

            timeLabel.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -10),
            timeLabel.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: -10),
        ])
    }
}
