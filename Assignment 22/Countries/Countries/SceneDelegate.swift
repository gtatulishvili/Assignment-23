//
//  SceneDelegate.swift
//  Countries
//
//  Created by Gega on 4/21/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        
        let loginVC = LoginViewController()
        let navigationController = UINavigationController(rootViewController: loginVC)
        
        window.rootViewController = navigationController
        self.window = window
        
        window.makeKeyAndVisible()
        
        // Check if user logged in for the first time and show alert if yes
        if UserDefaults.standard.bool(forKey: "FirstLogin") {
            let alert = UIAlertController(title: "Welcome", message: "Welcome back!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            navigationController.present(alert, animated: true, completion: nil)
        }
    }
    
    func checkForStoredCredentials() {
        if let storedUsername = UserDefaults.standard.string(forKey: "Username") {
            if let storedPassword = KeychainService.getPassword(forUsername: storedUsername) {
                // Perform automatic login with stored credentials
                // If successful, transition to the main interface
                transitionToMainInterface()
            }
        }
    }

    func transitionToMainInterface() {
        let mainViewController = CountriesTableViewController()
        if let window = self.window {
            window.rootViewController = UINavigationController(rootViewController: mainViewController)
            window.makeKeyAndVisible()
        }
    }


    // ... the rest of your SceneDelegate code ...
}
