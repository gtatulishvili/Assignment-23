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

        window.rootViewController = UINavigationController(rootViewController: CountriesTableViewController())

        self.window = window
        window.makeKeyAndVisible()
    }

    // ... the rest of your SceneDelegate code ...
}
