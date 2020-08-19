//
//  SceneDelegate.swift
//  Todo
//
//  Created by CHEN SINYU on 2020/08/16.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit
import Firebase
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var navigationController: UINavigationController?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else {
            return
        }
        FirebaseApp.configure()
        if(UserDefaults.standard.string(forKey: "isLogined") != nil) {
            let vc = TodoListViewController(uuid: (UserDefaults.standard.string(forKey: "isLogined"))!)
            navigationController = UINavigationController(rootViewController: vc)
        } else {
            navigationController = UINavigationController(rootViewController: AuthViewController())
        }
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        window = UIWindow(windowScene: scene)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    
}

