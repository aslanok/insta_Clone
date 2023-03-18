//
//  UserProfileRouter.swift
//  instagram_Clone
//
//  Created by MacBook on 19.03.2023.
//

import UIKit

protocol UserProfileRouting {
    
}

class UserProfileRouter : UserProfileRouting {
    
    var viewController : UIViewController{
        let view = UserProfileViewController()
        let userProfileUseCase = UserProfileUseCase()
        let presenter = UserProfilePresenter(router: self, view: view, userProfileUseCase: userProfileUseCase)
        
        userProfileUseCase.output = presenter
        view.presenter = presenter
        
        presenter.output = view
        
        return view
    }
    
}
