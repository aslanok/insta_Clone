//
//  MainTabBarPresenter.swift
//  instagram_Clone
//
//  Created by MacBook on 23.03.2023.
//

import UIKit

protocol MainTabBarPresentation {
    func getUserInfo()
}

class MainTabBarPresenter : MainTabBarPresentation , MainTabBarUseCaseOutput{
    
    internal var output : MainTabBarViewContract
    let router : MainTabBarRouting
    private var mainTabBarUseCase : MainTabBarUseCaseInput
    
    init(router : MainTabBarRouting, view : MainTabBarViewContract, mainTabBarUseCase : MainTabBarUseCaseInput){
        self.output = view
        self.router = router
        self.mainTabBarUseCase = mainTabBarUseCase
    }
    
    func getUserInfo() {
        mainTabBarUseCase.getUserInfo()
    }
    
    func setUserProfileFetched() {
        print("set profile fetched")
    }
    
    func setNoActiveUser() {
        router.presentLogInScreen(from: output)
        print("no user")
    }
    
    func setUserProfileFetchFailed(errorMessage: String) {
        
    }
    
    
    
    
}
