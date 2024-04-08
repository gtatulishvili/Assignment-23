//
//  ViewController.swift
//  Assignment14
//
//  Created by Gega on 4/7/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    private let laptopImageView = UIImageView()
    private let welcomeLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let authorizationLabel = UILabel()
    private let fullNameTextField = UITextField()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupTextFieldObservers()
        
        setupLine()
        setupGoogleAndFacebookButtons()
    }

    private func setupUI() {
        setupLaptopImageView()
        setupWelcomeLabel()
        setupDescriptionLabel()
        setupAuthorizationLabel()
        setupAuthorizationLine()
        setupFullNameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginButton()
        
        let stackView = UIStackView(arrangedSubviews: [laptopImageView, welcomeLabel, descriptionLabel, authorizationLabel, fullNameTextField, emailTextField, passwordTextField, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    private func setupLaptopImageView() {
        laptopImageView.image = UIImage(systemName: "lock.laptopcomputer")
        laptopImageView.contentMode = .scaleAspectFit
        laptopImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    

    
    private func setupLoginButton() {
        loginButton.setTitle("შესვლა", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 12
        loginButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }

    @objc private func loginButtonTapped() {
        
    }

    
    private func isEmailValid(_ email: String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    
    private func setupTextFieldObservers() {
        emailTextField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
    }

    @objc private func emailTextFieldChanged() {
        if !isEmailValid(emailTextField.text ?? "") {
            emailTextField.layer.borderColor = UIColor.red.cgColor
            emailTextField.layer.borderWidth = 1.0
        } else {
            emailTextField.layer.borderColor = UIColor.clear.cgColor
        }
    }

    @objc private func passwordTextFieldChanged() {
        let passwordCount = passwordTextField.text?.count ?? 0
        if passwordCount < 6 || passwordCount > 15 {
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            passwordTextField.layer.borderWidth = 1.0
        } else {
            passwordTextField.layer.borderColor = UIColor.clear.cgColor
        }
    }
    


        private func setupWelcomeLabel() {
            welcomeLabel.text = "მოგესალმებით!"
            welcomeLabel.font = UIFont(name: "Sylfaen", size: 24)
            welcomeLabel.textColor = .black
            welcomeLabel.textAlignment = .center
        }

        private func setupDescriptionLabel() {
            descriptionLabel.text = "ამ აპლიკაციის გამოყენების საუკეთესო გზა თქვენს ანგარიშზე შესვლაა, თუ არ გაქვთ ანგარიში გააკეთეთ, თუ არ გსურთ გაკეთება დასტოვეთ აქაურობა და წაშალეთ აპლიკაცია.."
            descriptionLabel.font = UIFont(name: "Sylfaen", size: 14)
            descriptionLabel.textColor = .black.withAlphaComponent(0.7)
            descriptionLabel.textAlignment = .center
            descriptionLabel.numberOfLines = 0
        }

        private func setupAuthorizationLabel() {
            authorizationLabel.text = "ავტორიზაცია"
            authorizationLabel.font = UIFont(name: "Sylfaen", size: 14)
            authorizationLabel.textColor = .black
            authorizationLabel.textAlignment = .left
        }

        private func setupFullNameTextField() {
            fullNameTextField.placeholder = "სრული სახელი"
            fullNameTextField.borderStyle = .roundedRect
            fullNameTextField.font = UIFont(name: "Sylfaen", size: 12)
        }

        private func setupEmailTextField() {
            emailTextField.placeholder = "ელ. ფოსტა"
            emailTextField.borderStyle = .roundedRect
            emailTextField.font = UIFont(name: "Sylfaen", size: 12)
            emailTextField.keyboardType = .emailAddress
            emailTextField.autocorrectionType = .no
        }

        private func setupPasswordTextField() {
            passwordTextField.placeholder = "პაროლი"
            passwordTextField.borderStyle = .roundedRect
            passwordTextField.font = UIFont(name: "Sylfaen", size: 12)
            passwordTextField.isSecureTextEntry = true
        }

        
    private func setupLine() {
        
        let lineView = UIView()
        lineView.backgroundColor = .lightGray // Line color
        lineView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineView)

        
        let orLabel = UILabel()
        orLabel.text = "or"
        orLabel.font = UIFont.systemFont(ofSize: 14)
        orLabel.textColor = .black
        orLabel.backgroundColor = .white
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(orLabel)

        NSLayoutConstraint.activate([
            
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            orLabel.centerXAnchor.constraint(equalTo: lineView.centerXAnchor),
            orLabel.centerYAnchor.constraint(equalTo: lineView.centerYAnchor),
        ])
    }
    
    private func setupAuthorizationLine() {
        let authorizationLine = UIView()
        authorizationLine.backgroundColor = UIColor(red: 51/255, green: 165/255, blue: 229/255, alpha: 1)
        authorizationLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(authorizationLine)

        NSLayoutConstraint.activate([
            authorizationLine.topAnchor.constraint(equalTo: authorizationLabel.bottomAnchor, constant: 8),
            authorizationLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            authorizationLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            authorizationLine.heightAnchor.constraint(equalToConstant: 2),
        ])
    }
    

    private func setupSocialButton(withImage imageName: String, title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.setTitle(title, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    private func setupGoogleAndFacebookButtons() {
        let googleButton = setupSocialButton(withImage: "g.circle.fill", title: " გამოიყენეთ გუგული")
        let facebookButton = setupSocialButton(withImage: "f.circle.fill", title: " გამოიყენეთ ფეიზბურგი")

        let buttonsStackView = UIStackView(arrangedSubviews: [googleButton, facebookButton])
        buttonsStackView.axis = .vertical
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 10
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsStackView)

        NSLayoutConstraint.activate([
            buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStackView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

}
