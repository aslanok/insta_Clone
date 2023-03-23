//
//  LogInUseCase.swift
//  instagram_Clone
//
//  Created by MacBook on 24.03.2023.
//

import Foundation
import Firebase

protocol LogInUseCaseInput{
    func logInExecute(email : String, password : String)
}

protocol LogInUseCaseOutput{
    func setLogInSuccessful()
    func setLogInFailed(errorMessage : String)
}

class LogInUseCase : LogInUseCaseInput {
    internal var output : LogInUseCaseOutput?
    
    func logInExecute(email : String, password : String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { [self] success, error in
            if let error = error {
                output?.setLogInFailed(errorMessage: error.localizedDescription)
            } else {
                output?.setLogInSuccessful()
            }
            
            
        }
        
    }
    
}
