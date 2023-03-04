//
//  RegisterPresenter.swift
//  instagram_Clone
//
//  Created by MacBook on 4.03.2023.
//

import UIKit

protocol RegisterPresentation{
    func signInUser(email: String, password : String)
}

class RegisterPresenter : RegisterPresentation, RegisterPageUseCaseOutput {
    internal var output : RegisterViewContract
    let router : RegisterRouting
    private var registerUseCase : RegisterPageUseCaseInput
    
    init(router : RegisterRouting, view : RegisterViewContract, registerCase : RegisterPageUseCaseInput){
        self.output = view
        self.router = router
        self.registerUseCase = registerCase
    }
    
    func signInUser(email: String, password: String) {
        registerUseCase.execute(email: email, password: password)
    }
    
    func setRegisterSuccess() {
        output.registerCompleted()
    }
    
    func setRegisterFailed(errorMessage: String) {
        output.registerFailed()
    }
    
    
    
}
