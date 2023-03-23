//
//  RegisterRouter.swift
//  instagram_Clone
//
//  Created by MacBook on 4.03.2023.
//

import UIKit

protocol RegisterRouting{
    func presentLogInPage(from view : UIViewController)
}

class RegisterRouter : RegisterRouting {
    
    var viewController : UIViewController {
        let view = RegisterViewController()
        let registerCase = RegisterPageUseCase()
        let presenter = RegisterPresenter(router: self, view: view, registerCase: registerCase )
        
        view.modalPresentationStyle = .fullScreen
        
        registerCase.output = presenter
        view.presenter = presenter
        presenter.output = view
        return view
    }
    
    func presentLogInPage(from view: UIViewController) {
        view.dismiss(animated: true)
    }
    
}
