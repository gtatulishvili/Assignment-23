//
//  LoginViewController.swift
//  Countries
//
//  Created by Gega on 4/24/24.
//

import UIKit
import Security

class LoginViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func profileImageTapped(_ sender: UITapGestureRecognizer) {
        presentImagePicker()
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
    
    func saveCredentialsIfFirstLogin(username: String, password: String) {
        let isFirstLogin = UserDefaults.standard.bool(forKey: "FirstLogin")
        if !isFirstLogin {
            // Save credentials to Keychain only if it's the first login
            KeychainService.savePassword(username: username, password: password)
            // Update UserDefault to indicate that the first login has occurred
            UserDefaults.standard.set(true, forKey: "FirstLogin")
        }
    }
    
    func presentImagePicker() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickedImage = info[.originalImage] as? UIImage else {
            picker.dismiss(animated: true, completion: nil)
            return
        }
        
        // Set the selected image to your image view
        profileImageView.image = pickedImage
        
        // Save the image to the Documents directory
        saveImageToDocumentsDirectory(image: pickedImage)
        
        // Dismiss the picker
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled
        picker.dismiss(animated: true, completion: nil)
    }

    
    func saveImageToDocumentsDirectory(image: UIImage) {
        guard let data = image.jpegData(compressionQuality: 1.0) else {
            print("Error: Could not get JPEG representation of UIImage")
            return
        }
        
        // Create a file name for the image
        let fileName = "profile_picture.jpg"
        
        // Get the path to the Documents directory
        let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        // Create the file URL by appending the new file name
        let fileURL = documentsDirectoryURL.appendingPathComponent(fileName)
        
        do {
            // Write the image data to the file URL
            try data.write(to: fileURL)
            print("Image was saved to the Documents directory.")
        } catch {
            print("Error saving image: \(error)")
        }
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
        // Perform login authentication here
        
        // Assuming you have validated the login, retrieve the entered username and password
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            // Handle case where username or password is empty
            return
        }

        // Save username and password to Keychain
        KeychainService.savePassword(username: username, password: password)

        // Proceed to the main screen
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

