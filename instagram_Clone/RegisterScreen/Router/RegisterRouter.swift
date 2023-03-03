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
        let presenter = RegisterPresenter(router: self, view: view)
        
        view.presenter = presenter
        return view
    }
    
}
