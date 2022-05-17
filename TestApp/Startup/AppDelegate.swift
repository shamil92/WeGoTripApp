//
//  AppDelegate.swift
//  TestApp
//
//  Created by Shamil on 14.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
      // MARK: - SET UIWindow
      
      setupWindow()
     
      return true
    }
    
    private func setupWindow() {
      window = UIWindow(frame: UIScreen.main.bounds)
      
      let router = Router.shared
      router.initialViewController()
      window?.rootViewController = router.navigationController
      window?.makeKeyAndVisible()
    }
}

