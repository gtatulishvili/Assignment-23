//
//  LoginViewController.swift
//  Countries
//
//  Created by Gega on 4/24/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let profileImageView = UIImageView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let repeatPasswordTextField = UITextField()
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupProfileImageView()
        setupTextFields()
        setupLoginButton()
    }
    
    private func setupProfileImageView() {
        profileImageView.image = UIImage(named: "person")
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupTextFields() {
        
        [usernameTextField, passwordTextField, repeatPasswordTextField].forEach { textField in
            textField.borderStyle = .roundedRect
            textField.backgroundColor = UIColor(named: "InputBackground")
            textField.textColor = UIColor(named: "InputText")
            textField.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(textField)
        }
        
        usernameTextField.placeholder = "Enter a username"
        passwordTextField.placeholder = "Enter the password"
        repeatPasswordTextField.placeholder = "Re-enter the password"

        passwordTextField.isSecureTextEntry = true
        repeatPasswordTextField.isSecureTextEntry = true

        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 40),
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            usernameTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: usernameTextField.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            repeatPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            repeatPasswordTextField.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor),
            repeatPasswordTextField.heightAnchor.constraint(equalTo: usernameTextField.heightAnchor)
        ])
    }

    
    private func setupLoginButton() {
        loginButton.setTitle("Log in", for: .normal)
        loginButton.backgroundColor = .systemBlue

        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 5
        loginButton.clipsToBounds = true
        loginButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped() {
        
        let countriesVC = CountriesTableViewController()
        
        
        if let navigationController = self.navigationController {
            navigationController.pushViewController(countriesVC, animated: true)
        } else {
            
            let navController = UINavigationController(rootViewController: countriesVC)
            navController.modalPresentationStyle = .fullScreen
            self.present(navController, animated: true)
        }
    }

}

