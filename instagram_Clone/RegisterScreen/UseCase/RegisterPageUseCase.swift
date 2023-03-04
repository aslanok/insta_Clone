//
//  RegisterPageUseCase.swift
//  instagram_Clone
//
//  Created by MacBook on 4.03.2023.
//

import UIKit
import Firebase

protocol RegisterPageUseCaseInput {
    func execute(email : String, password : String)
}

protocol RegisterPageUseCaseOutput {
    func setRegisterSuccess()
    func setRegisterFailed(errorMessage : String)
}

class RegisterPageUseCase : RegisterPageUseCaseInput {
    
    internal var output : RegisterPageUseCaseOutput?
    
    func execute(email: String, password: String) {
        if email != "" && password != "" {
            Auth.auth().createUser(withEmail: email, password: password){ authResult, error in
                if let e = error{
                    self.output?.setRegisterFailed(errorMessage: e.localizedDescription)
                } else {
                    self.output?.setRegisterSuccess()
                }
            }
        }
    }
}
