//
//  RegisterPresenter.swift
//  instagram_Clone
//
//  Created by MacBook on 4.03.2023.
//

import UIKit

protocol RegisterPresentation{
    
}

class RegisterPresenter : RegisterPresentation {
    let output : RegisterViewContract
    let router : RegisterRouting
    
    init(router : RegisterRouting, view : RegisterViewContract){
        self.output = view
        self.router = router
    }
    
    
    
}
