//
//  DetailsViewController.swift
//  ContactsApp
//
//  Created by Gega on 4/13/24.
//

import UIKit

class DetailsViewController: UIViewController {
    var contactName: String?
    var contactImageName: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.lightGray
        
        let topBackgroundView = UIView()
        topBackgroundView.backgroundColor = UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1)
        topBackgroundView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 304)
        view.addSubview(topBackgroundView)
        
        let imageView = UIImageView(frame: CGRect(x: (view.frame.width - 140) / 2, y: 82, width: 140, height: 140))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 70
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: contactImageName ?? "Boy1.png")
        topBackgroundView.addSubview(imageView)

        let nameLabel = UILabel(frame: CGRect(x: 0, y: imageView.frame.maxY + 10, width: view.frame.width, height: 30))
        nameLabel.textAlignment = .center
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 24)
        nameLabel.text = contactName ?? "Unknown Name"
        topBackgroundView.addSubview(nameLabel)
        
        let containerView = UIView(frame: CGRect(x: 7, y: topBackgroundView.frame.maxY + 20, width: view.frame.width - 14, height: 180))
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 15
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.addSubview(containerView)

        let genderLabel = UILabel(frame: CGRect(x: 30, y: 14, width: 150, height: 22))
        genderLabel.text = "Gender:"
        genderLabel.font = UIFont.systemFont(ofSize: 17)
        containerView.addSubview(genderLabel)

        let genderValueLabel = UILabel(frame: CGRect(x: containerView.frame.width - 198, y: 14, width: 168, height: 22))
        genderValueLabel.text = "Male"
        genderValueLabel.font = UIFont.systemFont(ofSize: 17)
        genderValueLabel.textAlignment = .right
        containerView.addSubview(genderValueLabel)

        let ageLabel = UILabel(frame: CGRect(x: 30, y: genderLabel.frame.maxY + 30, width: 150, height: 22))
        ageLabel.text = "Age (years):"
        ageLabel.font = UIFont.systemFont(ofSize: 17)
        containerView.addSubview(ageLabel)

        let ageValueLabel = UILabel(frame: CGRect(x: containerView.frame.width - 198, y: genderLabel.frame.maxY + 30, width: 168, height: 22))
        ageValueLabel.text = "29"
        ageValueLabel.font = UIFont.systemFont(ofSize: 17)
        ageValueLabel.textAlignment = .right
        containerView.addSubview(ageValueLabel)

        let hobbyLabel = UILabel(frame: CGRect(x: 30, y: ageLabel.frame.maxY + 30, width: containerView.frame.width - 60, height: 44))
        hobbyLabel.text = "Hobby:"
        hobbyLabel.font = UIFont.systemFont(ofSize: 17)
        containerView.addSubview(hobbyLabel)

        let hobbyValueLabel = UILabel(frame: CGRect(x: containerView.frame.width - 198, y: ageLabel.frame.maxY + 30, width: 168, height: 44))
        hobbyValueLabel.text = "To learn lyrics of every Rihanna song"
        hobbyValueLabel.font = UIFont.systemFont(ofSize: 17)
        hobbyValueLabel.textAlignment = .right
        hobbyValueLabel.numberOfLines = 0
        containerView.addSubview(hobbyValueLabel)
        containerView.frame.size.height = hobbyValueLabel.frame.maxY + 20
        containerView.layer.cornerRadius = 15
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        createSeparatorLine(below: genderLabel, inside: containerView, at: genderValueLabel.frame.maxY)
        createSeparatorLine(below: ageLabel, inside: containerView, at: ageValueLabel.frame.maxY)
        
        containerView.frame.size.height = hobbyValueLabel.frame.maxY + 20
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    private func createSeparatorLine(below view: UIView, inside containerView: UIView, at positionY: CGFloat) {
            let separatorLine = UIView(frame: CGRect(x: 23, y: positionY + 10, width: containerView.frame.width - 46, height: 0.5))
            separatorLine.backgroundColor = UIColor(white: 0.667, alpha: 1)
            containerView.addSubview(separatorLine)
        }
}
