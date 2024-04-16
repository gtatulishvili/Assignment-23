//
//  SplashViewController.swift
//  Assignment 17
//
//  Created by Gega on 4/15/24.
//

import UIKit

class SplashViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        let backgroundImageView = UIImageView(frame: self.view.bounds)
        backgroundImageView.image = UIImage(named: "wallpaper.jpg")
        backgroundImageView.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundImageView)
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "წუწუნი Hub"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont(name: "FiraGO", size: 30)
        titleLabel.textAlignment = .center
        self.view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -50),
            titleLabel.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.showOnboardingScreen()
        }
    }
    
    private func showOnboardingScreen() {
        let onboardingVC = OnboardingViewController()
        onboardingVC.modalPresentationStyle = .fullScreen
        present(onboardingVC, animated: true)
    }
}
