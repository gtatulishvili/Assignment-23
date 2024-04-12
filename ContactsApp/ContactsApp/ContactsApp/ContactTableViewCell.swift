//
//  ContactTableViewCell.swift
//  ContactsApp
//
//  Created by Gega on 4/12/24.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    var nameLabel: UILabel!
    var iconImageView: UIImageView!
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func setupUI() {

        iconImageView = UIImageView(frame: CGRect.zero)
        iconImageView.layer.cornerRadius = 30
        iconImageView.clipsToBounds = true
        iconImageView.contentMode = .scaleAspectFill
        addSubview(iconImageView)
        
        nameLabel = UILabel(frame: CGRect.zero)
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        nameLabel.textAlignment = .left
        addSubview(nameLabel)
        
        accessoryType = .disclosureIndicator
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconImageView.frame = CGRect(x: 16, y: 6, width: 60, height: 60)
        iconImageView.layer.cornerRadius = iconImageView.frame.height / 2
        
        nameLabel.frame = CGRect(x: 84, y: (contentView.frame.height - 22) / 2, width: contentView.frame.width - 100, height: 22)
    }
    
    func configure(name: String, imageName: String) {
        nameLabel.text = name
        iconImageView.image = UIImage(named: imageName)
        iconImageView.isHidden = true
    }
    
    func hideIcon() {
            iconImageView.isHidden = true
        }
}
