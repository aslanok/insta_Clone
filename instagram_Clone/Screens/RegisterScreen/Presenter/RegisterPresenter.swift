//
//  RegisterPresenter.swift
//  instagram_Clone
//
//  Created by MacBook on 4.03.2023.
//

import UIKit
import FirebaseStorage

protocol RegisterPresentation{
    func signInUser(email: String, password : String, userName : String)
    func savePhoto(imageName : String, imageData : Data)
    func getDownloadURL(ref : StorageReference)
    func saveUserData()
    func presentLogInPage()
}

class RegisterPresenter : RegisterPresentation, RegisterPageUseCaseOutput {
    internal var output : RegisterViewContract
    let router : RegisterRouting
    private var registerUseCase : RegisterPageUseCaseInput
    
    private var _nickName : String = ""
    private var _userId : String = ""
    private var _urlString : String = ""
    
    init(router : RegisterRouting, view : RegisterViewContract, registerCase : RegisterPageUseCaseInput){
        self.output = view
        self.router = router
        self.registerUseCase = registerCase
    }
    
    func signInUser(email: String, password: String, userName : String ) {
        _nickName = userName
        registerUseCase.execute(email: email, password: password)
    }
    
    func savePhoto(imageName: String, imageData: Data) {
        registerUseCase.savePhotoExecute(imageName: imageName, imageData: imageData)
    }
    
    func getDownloadURL(ref: StorageReference) {
        registerUseCase.getDownloadURLExecute(ref: ref)
    }
    
    func saveUserData() {
        let userData = UserSavedData(nickName: _nickName, userId: _userId, urlString: _urlString)
        registerUseCase.saveUserData(userData: userData)
    }
    
    func presentLogInPage() {
        router.presentLogInPage(from: output)
    }
    
    func setRegisterSuccess(userId : String) {
        _userId = userId
        output.registerCompleted(userId: userId)
    }
    
    func setRegisterFailed(errorMessage: String) {
        print("register olmadı : \(errorMessage)")
        output.registerFailed()
    }
    
    func setSavePhotoSuccess(ref : StorageReference) {
        getDownloadURL(ref: ref)
    }
    
    func setSavePhotoFailed(errorMessage: String) {
        print("errorMessage : \(errorMessage)")
    }
    
    func getDownloadURLSuccess(url : String) {
        _urlString = url
        saveUserData()
    }
    
    func getDownloadURLFailed(errorMessage: String) {
        
    }
    
    func saveUserDataSuccess() {
        output.saveDataCompled()
        print("save data completed oldu")
    }
    
    func saveUserDataFailed(errorMessage: String) {
        output.registerFailed()
        print("save Data failed : \(errorMessage)")
    }
}

struct UserSavedData {
    let nickName : String
    let userId : String
    let urlString : String
}
