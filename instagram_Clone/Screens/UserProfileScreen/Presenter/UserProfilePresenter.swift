//
//  UserProfilePresenter.swift
//  instagram_Clone
//
//  Created by MacBook on 19.03.2023.
//

import UIKit

protocol UserProfilePresentation {
    func getUser()
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
    
    func setGetUserSuccess(data: UserSavedData) {
        print("kullanici adi : \(data.nickName)")
    }
    
    func setGetUserFailed(errorMessage: String) {
        print("failed : \(errorMessage)")
    }
    
}
