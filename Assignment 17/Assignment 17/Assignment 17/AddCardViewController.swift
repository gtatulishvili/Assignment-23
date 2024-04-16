//
//  AddCardViewController.swift
//  Assignment 17
//
//  Created by Gega on 4/16/24.
//

import UIKit

class AddCardViewController: UIViewController {
    
    let titleTextField = UITextField()
    let descriptionTextField = UITextField()
    let iconSelectionStackView = UIStackView()
    let saveButton = UIButton(type: .system)
    
    let iconNames = ["Red icon", "Purple icon", "Green icon", "Yellow icon"]
    
    var selectedIconName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupTextFields()
        setupIconSelection()
        setupSaveButton()
    }
    
    private func setupBackground() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "wallpaper")
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
    }
    
    private func setupTextFields() {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "FiraGO", size: 14)
        titleLabel.text = "სათაური"
        titleLabel.textColor = .white
        view.addSubview(titleLabel)
        
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont(name: "FiraGO", size: 14)
        descriptionLabel.text = "აღწერა"
        descriptionLabel.textColor = .white
        view.addSubview(descriptionLabel)
        
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.attributedPlaceholder = NSAttributedString(
            string: "მაგ: პანიკა, დახმარება მჭირდება",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        titleTextField.font = UIFont(name: "FiraGO", size: 12)
        titleTextField.textColor = .white
        titleTextField.backgroundColor = UIColor(hex: "#1F222D")
        titleTextField.layer.borderColor = UIColor(hex: "#8D8D8D").cgColor
        titleTextField.layer.borderWidth = 1
        titleTextField.layer.cornerRadius = 9
        view.addSubview(titleTextField)
        
        descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextField.attributedPlaceholder = NSAttributedString(
            string: "მაგ: ფიგმამ გამიჭედა და ვინმემ გამომიგზავნეთ",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        descriptionTextField.font = UIFont(name: "FiraGO", size: 12)
        descriptionTextField.textColor = .white
        descriptionTextField.backgroundColor = UIColor(hex: "#1F222D")
        descriptionTextField.layer.borderColor = UIColor(hex: "#8D8D8D").cgColor
        descriptionTextField.layer.borderWidth = 1
        descriptionTextField.layer.cornerRadius = 9
        view.addSubview(descriptionTextField)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 91),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -43),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33),
            titleTextField.heightAnchor.constraint(equalToConstant: 45),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -43),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 24),
            
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            descriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            descriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func setupIconSelection() {

        iconSelectionStackView.translatesAutoresizingMaskIntoConstraints = false
        iconSelectionStackView.distribution = .fillEqually
        iconSelectionStackView.spacing = 10
        iconSelectionStackView.axis = .horizontal
        view.addSubview(iconSelectionStackView)
        
        for (index, iconName) in iconNames.enumerated() {
                    let button = UIButton(type: .system)
                    if let image = UIImage(named: iconName)?.withRenderingMode(.alwaysOriginal) {
                        button.setImage(image, for: .normal)
                    }
                    button.tag = index
                    button.addTarget(self, action: #selector(iconSelected(_:)), for: .touchUpInside)
                    iconSelectionStackView.addArrangedSubview(button)
                }
        
        NSLayoutConstraint.activate([
            iconSelectionStackView.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 40),
            iconSelectionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            iconSelectionStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33),
            iconSelectionStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupSaveButton() {

        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("დამატება", for: .normal)
        saveButton.backgroundColor = UIColor(hex: "#009B10")
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.layer.cornerRadius = 22
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
        saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        saveButton.widthAnchor.constraint(equalToConstant: 200),
        saveButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        saveButton.addTarget(self, action: #selector(saveCard), for: .touchUpInside)
    }
    
    @objc private func iconSelected(_ sender: UIButton) {

        if let index = iconSelectionStackView.arrangedSubviews.firstIndex(of: sender) {
            selectedIconName = iconNames[index]

            sender.alpha = 0.6
            UIView.animate(withDuration: 0.6) {
                sender.alpha = 1.0
            }
        }
    }
    
    @objc private func saveCard() {
        
        navigationController?.popViewController(animated: true)
    }
}

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        if scanner.scanHexInt64(&hexNumber) {
            let r = (hexNumber & 0xff0000) >> 16
            let g = (hexNumber & 0x00ff00) >> 8
            let b = (hexNumber & 0x0000ff)
            self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: 1)
            return
        }
        self.init(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
