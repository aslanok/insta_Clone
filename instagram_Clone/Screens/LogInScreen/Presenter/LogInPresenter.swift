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
    func logIn(email : String, password : String)
    func dismiss()
}

class LogInPresenter : LogInPresentation, LogInUseCaseOutput {
    
    internal var output : LogInViewContract
    let router : LogInRouting
    private var logInUseCase : LogInUseCaseInput
    
    init(router : LogInRouting, view : LogInViewContract, logInUseCase : LogInUseCaseInput){
        self.router = router
        self.output = view
        self.logInUseCase = logInUseCase
    }
    
    func logIn(email: String, password: String) {
        logInUseCase.logInExecute(email: email, password: password)
    }
    
    func setLogInSuccessful() {
        output.displayLogInSuccess()
    }
    
    func setLogInFailed(errorMessage: String) {
        print("errorlogInde : \(errorMessage)")
    }
    
    func presentRegister() {
        router.presentRegister(from: output)
    }
    
    func dismiss() {
        router.dismiss(from: output)
    }
    
}
