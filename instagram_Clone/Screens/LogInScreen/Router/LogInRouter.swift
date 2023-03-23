//
//  LogInRouter.swift
//  instagram_Clone
//
//  Created by MacBook on 23.03.2023.
//

import UIKit

protocol LogInRouting {
    func presentRegister(from view: UIViewController)
    func dismiss(from view : UIViewController)
}

class LogInRouter : LogInRouting {
    
    var viewController : UIViewController {
        let view = LogInViewController()
        let logInUseCase = LogInUseCase()
        let presenter = LogInPresenter(router: self, view: view, logInUseCase: logInUseCase)
        
        view.modalPresentationStyle = .fullScreen
        
        logInUseCase.output = presenter
        view.presenter = presenter
        presenter.output = view
        return view
    }
    
    func presentRegister(from view: UIViewController) {
        view.present(RegisterRouter().viewController, animated: true)
    }
    
    func dismiss(from view: UIViewController) {
        view.dismiss(animated: true)
    }
    
    
}
