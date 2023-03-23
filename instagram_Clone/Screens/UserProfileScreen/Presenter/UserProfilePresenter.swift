//
//  UserProfilePresenter.swift
//  instagram_Clone
//
//  Created by MacBook on 19.03.2023.
//

import UIKit

protocol UserProfilePresentation {
    func getUser()
    func logOut()
}

class UserProfilePresenter : UserProfilePresentation, UserProfileUseCaseOutput {
    
    internal var output : UserProfileViewContract
    let router : UserProfileRouting
    private var userProfileUseCase : UserProfileUseCaseInput
    
    init(router : UserProfileRouting, view : UserProfileViewContract, userProfileUseCase : UserProfileUseCaseInput){
        self.output = view
        self.router = router
        self.userProfileUseCase = userProfileUseCase
    }
    
    func getUser() {
        userProfileUseCase.getUserExecute()
    }
    
    func logOut() {
        userProfileUseCase.logOutExecute()
    }
    
    func setGetUserSuccess(data: UserSavedData) {
        output.displayUserInfo(userData: data)
    }
    
    func setGetUserFailed(errorMessage: String) {
        print("failed : \(errorMessage)")
    }
    
    func setLogOutSuccess() {
        router.presentLogIn(from: output)
        print("çıkış yapıldı")
    }
    
    func setLogOutFailed(errorMessage: String) {
        print("çıkış fail")
    }
    
}
