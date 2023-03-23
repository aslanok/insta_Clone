//
//  MainTabBarRouter.swift
//  instagram_Clone
//
//  Created by MacBook on 23.03.2023.
//

import UIKit

protocol MainTabBarRouting {
    func presentLogInScreen(from view : UITabBarController)
}

class MainTabBarRouter : MainTabBarRouting {
    
    var viewController : UITabBarController {
        let view = MainTabBarViewController()
        let mainTabBarUseCase = MainTabBarUseCase()
        let presenter = MainTabBarPresenter(router: self, view: view, mainTabBarUseCase: mainTabBarUseCase)
        
        mainTabBarUseCase.output = presenter
        presenter.output = view
        view.presenter = presenter
        return view
    }
    
    func presentLogInScreen(from view: UITabBarController) {
        DispatchQueue.main.async {
            view.present(LogInRouter().viewController, animated: true)
        }
    }
    
}
