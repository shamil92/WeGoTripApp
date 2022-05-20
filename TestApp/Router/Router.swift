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
}

final class Router: RouterProtocol {
    
    //MARK: - Singleton
    
    static let shared = Router()
    
    private init() {}
    
    // MARK: - Properties
    
    let navigationController = UINavigationController()
    let assemblyBuilder = AssemblyModuleBuilder()
    
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
