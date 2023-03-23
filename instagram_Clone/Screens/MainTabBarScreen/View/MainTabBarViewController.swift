//
//  MainTabBarViewController.swift
//  instagram_Clone
//
//  Created by MacBook on 18.03.2023.
//

import UIKit

protocol MainTabBarViewContract : UITabBarController {
    
}

class MainTabBarViewController : UITabBarController, MainTabBarViewContract {
    
    var presenter : MainTabBarPresentation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        tabBar.tintColor = .black
        let userProfileViewController = UserProfileRouter().viewController
        userProfileViewController.tabBarItem.image = UIImage(named: "profile")
        userProfileViewController.tabBarItem.selectedImage = UIImage(named: "profileSelected")
        viewControllers = [userProfileViewController, UIViewController()]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getUserInfo()
    }
    
}
