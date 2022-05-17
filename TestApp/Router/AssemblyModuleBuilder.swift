//
//  AssemblyBuilder.swift
//  TestApp
//
//  Created by Shamil on 14.05.2022.
//

import Foundation
import UIKit

protocol AssemblyBuilderProtocol {
    func createMainModule() -> UIViewController
}

// MARK: - AssemblyModuleBuilder

final class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    
    func createFirstFeedbackModule() -> UIViewController {
        let vc = FirstFeedbackVC()
        return vc
    }
    
    func createMainModule() -> UIViewController {
        let mainView = MainViewController()
        return mainView
    }
}
