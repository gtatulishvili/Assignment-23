//
//  MainViewController.swift
//  Assignment 17
//
//  Created by Gega on 4/15/24.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "wallpaper")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 156, height: 192)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView?.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        collectionView?.backgroundColor = .clear
        collectionView?.delegate = self
        collectionView?.dataSource = self
        view.addSubview(collectionView ?? UICollectionView())
        
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        let addNewComplaintButton = UIButton(type: .system)
        addNewComplaintButton.translatesAutoresizingMaskIntoConstraints = false
        addNewComplaintButton.setTitle("ახალი წუწუნ ბარათის დამატება", for: .normal)
        addNewComplaintButton.titleLabel?.font = UIFont(name: "FiraGO", size: 20)
        addNewComplaintButton.setTitleColor(.white, for: .normal)
        addNewComplaintButton.backgroundColor = UIColor.blue
        addNewComplaintButton.layer.cornerRadius = 24
        view.addSubview(addNewComplaintButton)
        
        NSLayoutConstraint.activate([
            addNewComplaintButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addNewComplaintButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addNewComplaintButton.widthAnchor.constraint(equalToConstant: 290),
            addNewComplaintButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        addNewComplaintButton.addTarget(self, action: #selector(addNewCard), for: .touchUpInside)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else {
            fatalError("Unable to dequeue CardCollectionViewCell.")
        }
        
        let iconName: String
        let title: String
        let description: String
        switch indexPath.item {
        case 0:
            iconName = "Red icon"
            title = "Beka ras gverchi?"
            description = "ახლა გავხსენი  დავალება"
        case 1:
            iconName = "Purple icon"
            title = "რამე სიმღერა მირჩიეთ"
            description = "დავალების კეთებისას მეძინება"
        case 2:
            iconName = "Green icon"
            title = "ფიგმამ თქვენც დაგტანჯათ?"
            description = "შევწუხდი ხარისხით"
        case 3:
            iconName = "Yellow icon"
            title = "მეტი ბედინა გვინდა"
            description = "აღარ  გვინდა ამდენი"
        default:
            iconName = "Red icon"
            title = "რამე"
            description = "რამე კაია"
        }
        
        cell.configure(with: iconName, title: title, description: description)
        
        return cell
    }
    
    @objc func addNewCard() {
        let addCardVC = AddCardViewController()
        
        if let navigationController = self.navigationController {
            navigationController.pushViewController(addCardVC, animated: true)
        } else {
            
            addCardVC.modalPresentationStyle = .fullScreen
            self.present(addCardVC, animated: true)
        }
    }
}




// Definition of CardCollectionViewCell
class CardCollectionViewCell: UICollectionViewCell {
    static let identifier = "CardCollectionViewCell"
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "FiraGO", size: 16)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "FiraGO", size: 10)
        label.textColor = UIColor(white: 1.0, alpha: 0.7)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        applyConstraints()
        
        contentView.backgroundColor = UIColor(red: 38/255, green: 42/255, blue: 52/255, alpha: 1)
        contentView.layer.cornerRadius = 12
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            iconImageView.widthAnchor.constraint(equalToConstant: 40),
            iconImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    func configure(with iconName: String, title: String, description: String) {
        iconImageView.image = UIImage(named: iconName)
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
