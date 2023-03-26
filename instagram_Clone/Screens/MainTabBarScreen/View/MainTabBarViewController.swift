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
        view.backgroundColor = .lightGray
        tabBar.tintColor = .black
        self.delegate = self
        
        let userProfileViewController = UserProfileRouter().viewController
        userProfileViewController.tabBarItem.image = UIImage(named: "profile")
        userProfileViewController.tabBarItem.selectedImage = UIImage(named: "profileSelected")
        
        let homeViewController = HomeRouter().viewController
        homeViewController.tabBarItem.image = UIImage(named: "homeScreenSelected")
        homeViewController.tabBarItem.selectedImage = UIImage(named: "homeScreenNotSelected")
        
        let searchScreenViewController = SearchScreenRouter().viewController
        searchScreenViewController.tabBarItem.image = UIImage(named: "searchSelected")
        searchScreenViewController.tabBarItem.selectedImage = UIImage(named: "searchNotSelected")
        
        let discoverScreenViewController = PhotoAddRouter().viewController
        discoverScreenViewController.tabBarItem.image = UIImage(named: "addIcon")
        discoverScreenViewController.tabBarItem.selectedImage = UIImage(named: "addIcon")
        
        let likesScreenViewController = LikesScreenRouter().viewController
        likesScreenViewController.tabBarItem.image = UIImage(named: "liked")
        likesScreenViewController.tabBarItem.selectedImage = UIImage(named: "notLiked")
        
        viewControllers = [homeViewController,searchScreenViewController,discoverScreenViewController,likesScreenViewController,userProfileViewController]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getUserInfo()
    }
    
}

extension MainTabBarViewController : UITabBarControllerDelegate{
    /*
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        guard let index = viewControllers?.firstIndex(of: viewController) else { return true }
        print("\(index) buton tapped ")
        if index == 2{
            return false
        }
        return true
    }
    */
}
