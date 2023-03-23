//
//  MainTabBarUseCase.swift
//  instagram_Clone
//
//  Created by MacBook on 23.03.2023.
//

import UIKit
import Firebase

protocol MainTabBarUseCaseInput {
    func getUserInfo()
}

protocol MainTabBarUseCaseOutput {
    func setUserProfileFetched()
    func setNoActiveUser()
    func setUserProfileFetchFailed(errorMessage : String)
}

class MainTabBarUseCase : MainTabBarUseCaseInput {
    internal var output : MainTabBarUseCaseOutput?
    
    func getUserInfo() {
        var currentUserId = ""
        if Auth.auth().currentUser == nil {
            output?.setNoActiveUser()
        } else {
            currentUserId = Auth.auth().currentUser?.uid ?? ""
            output?.setUserProfileFetched()
        }
    }
    
}

