//
//  OnboardingViewController.swift
//  Assignment 17
//
//  Created by Gega on 4/15/24.
//

import UIKit

class OnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "wallpaper2")
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(backgroundImage)
        
        let infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.numberOfLines = 0
        infoLabel.text = "შედი\nაპლიკაციაში\nდა იწუწუნე\nრამდენიც გინდა"
        infoLabel.font = UIFont(name: "FiraGO", size: 30)
        infoLabel.textColor = .white
        infoLabel.textAlignment = .left
        view.addSubview(infoLabel)
        
        let startButton = UIButton(type: .system)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitle("დაწყება", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "FiraGO", size: 20)
        startButton.setTitleColor(.white, for: .normal)
        startButton.backgroundColor = UIColor.blue
        startButton.layer.cornerRadius = 24
        view.addSubview(startButton)
        
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
        setupConstraints(infoLabel: infoLabel, startButton: startButton)
    }
    
    private func setupConstraints(infoLabel: UILabel, startButton: UIButton) {

        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 382),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            infoLabel.heightAnchor.constraint(equalToConstant: 192)
        ])
        
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            startButton.widthAnchor.constraint(equalToConstant: 123),
            startButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    @objc private func startButtonTapped() {

        let mainViewController = MainViewController()
        mainViewController.modalPresentationStyle = .fullScreen
        present(mainViewController, animated: true)
    }
}
