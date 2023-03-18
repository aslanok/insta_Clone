//
//  RegisterRouter.swift
//  instagram_Clone
//
//  Created by MacBook on 4.03.2023.
//

import UIKit

protocol RegisterRouting{
    
}

class RegisterRouter : RegisterRouting {
    
    var viewController : UIViewController {
        let view = RegisterViewController()
        let registerCase = RegisterPageUseCase()
        let presenter = RegisterPresenter(router: self, view: view, registerCase: registerCase )
        
        registerCase.output = presenter
        view.presenter = presenter
        
        presenter.output = view
        return view
    }
    
}
