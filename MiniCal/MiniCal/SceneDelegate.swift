//
//  SceneDelegate.swift
//  MiniCal
//
//  Created by zm on 2020/9/21.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let contentView = ContentView()
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)

            self.window = window
            window.makeKeyAndVisible()
            showAlert(scene, contexts: connectionOptions.urlContexts)
        }

    }

    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        showAlert(scene, contexts: URLContexts)
    }
    
    func showAlert(_ scene: UIScene, contexts: Set<UIOpenURLContext>) {
        window?.alert("Open System's Calendar？", actionTitle: "Yes", handler: {
            
            guard let url = contexts.first?.url,  UIApplication.shared.canOpenURL(url) else {
                return
            }
            scene.open(url, options: .none, completionHandler: .none)
            
        })
    }
}

