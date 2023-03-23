//
//  LogInPresenter.swift
//  instagram_Clone
//
//  Created by MacBook on 23.03.2023.
//

import Foundation
import UIKit

protocol LogInPresentation {
    func presentRegister()
}

class LogInPresenter : LogInPresentation {
    
    internal var output : LogInViewContract
    let router : LogInRouting
    
    init(router : LogInRouting, view : LogInViewContract){
        self.router = router
        self.output = view
    }
    
    func presentRegister() {
        router.presentRegister(from: output)
    }
    
}
