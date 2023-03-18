//
//  MainTabBarViewController.swift
//  instagram_Clone
//
//  Created by MacBook on 18.03.2023.
//

import UIKit

class MainTabBarViewController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        tabBar.tintColor = .black
        
        
        let userProfileViewController = UserProfileRouter().viewController
        userProfileViewController.tabBarItem.image = UIImage(named: "profile")
        userProfileViewController.tabBarItem.selectedImage = UIImage(named: "profileSelected")
        
        viewControllers = [userProfileViewController, UIViewController()]
    }
    
}
