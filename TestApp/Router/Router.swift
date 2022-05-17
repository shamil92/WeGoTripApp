//
//  Router.swift
//  TestApp
//
//  Created by Shamil on 14.05.2022.
//


import UIKit
import PanModal

protocol RouterProtocol {
    
    func dismiss()
    func initialViewController()
    func openFirstFeedBackVC()
//    func replaceRootController(on view: UIViewController)

}

final class Router: RouterProtocol {
    
    
    static let shared = Router()
    private init() {}
    
    // MARK: - Properties
    
//    private var window: UIWindow {
//        guard let window = UIApplication.shared.keyWindow else {
//            let window = UIWindow(frame: UIScreen.main.bounds)
//            window.makeKeyAndVisible()
//            return window
//        }
//        return window
//    }

    
    let navigationController = UINavigationController()
    let assemblyBuilder = AssemblyModuleBuilder()
    
    
//    func replaceRootController(on view: UIViewController) {
//        let navigationController = UINavigationController(rootViewController: view)
//        window.rootViewController = navigationController
//    }
    
    
    // MARK: - Dismiss
    
    func dismiss() {
            navigationController.popToRootViewController(animated: true)
    }
        
    // MARK: - OpenMainScreen
    
    func initialViewController() {
        let mainVC = assemblyBuilder.createMainModule()
        navigationController.navigationBar.isHidden = true
        navigationController.viewControllers = [mainVC]
    }
  
    // MARK: - OpenSecondScreen

    func openFirstFeedBackVC() {
            let vc = assemblyBuilder.createFirstFeedbackModule()
            navigationController.navigationBar.isHidden = true
        navigationController.present(vc, animated: true)
        }
    }
