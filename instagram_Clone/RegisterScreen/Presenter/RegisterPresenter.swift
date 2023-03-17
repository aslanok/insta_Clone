//
//  RegisterPresenter.swift
//  instagram_Clone
//
//  Created by MacBook on 4.03.2023.
//

import UIKit

protocol RegisterPresentation{
    func signInUser(email: String, password : String)
    func savePhoto(imageName : String, imageData : Data)
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
    
    func savePhoto(imageName: String, imageData: Data) {
        registerUseCase.savePhotoExecute(imageName: imageName, imageData: imageData)
    }
    
    func setRegisterSuccess(userId : String) {
        output.registerCompleted(userId: userId)
    }
    
    func setRegisterFailed(errorMessage: String) {
        print("register olmadı : \(errorMessage)")
        output.registerFailed()
    }
    
    func setSavePhotoSuccess() {
        print("foto başarıyla kaydedildi")
    }
    
    func setSavePhotoFailed(errorMessage: String) {
        print("errorMessage : \(errorMessage)")
    }
    
    
    
}
