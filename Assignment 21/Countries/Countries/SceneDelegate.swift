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
        let loginVC = LoginViewController() // Create an instance of LoginViewController

        // Set the rootViewController to a UINavigationController for future navigation
        window.rootViewController = UINavigationController(rootViewController: loginVC)

        self.window = window
        window.makeKeyAndVisible()
    }

    // ... the rest of your SceneDelegate code ...
}
