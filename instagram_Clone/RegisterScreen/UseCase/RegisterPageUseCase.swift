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
    func savePhotoExecute(imageName : String, imageData : Data)
}

protocol RegisterPageUseCaseOutput {
    func setRegisterSuccess(userId : String )
    func setRegisterFailed(errorMessage : String)
    func setSavePhotoSuccess()
    func setSavePhotoFailed(errorMessage : String)
}

class RegisterPageUseCase : RegisterPageUseCaseInput {
    
    internal var output : RegisterPageUseCaseOutput?
    
    func execute(email: String, password: String) {
        if email != "" && password != "" {
            Auth.auth().createUser(withEmail: email, password: password){ authResult, error in
                if let e = error{
                    self.output?.setRegisterFailed(errorMessage: e.localizedDescription)
                } else {
                    self.output?.setRegisterSuccess(userId: authResult?.user.uid ?? "" )
                }
            }
        }
    }
    
    func savePhotoExecute(imageName: String, imageData: Data) {
        let ref = Storage.storage().reference(withPath: "/ProfilPhotos/\(imageName)")
        ref.putData(imageData, metadata: nil) { [self] (success , error) in
            if let error = error {
                output?.setSavePhotoFailed(errorMessage: error.localizedDescription)
            } else {
                output?.setSavePhotoSuccess()
            }
            
        }
    }
    
}
