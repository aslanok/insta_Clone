//
//  UserProfileViewController.swift
//  instagram_Clone
//
//  Created by MacBook on 18.03.2023.
//

import UIKit
import SDWebImage

protocol UserProfileViewContract : UIViewController {
    func displayUserInfo(userData : UserSavedData)
}

class UserProfileViewController : UIViewController, UserProfileViewContract {
    
    internal var presenter : UserProfilePresentation?
    
    private lazy var userProfileNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "User Profile"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var profilePhoto : UIImageView = {
        let image = UIImage(named: "profile")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
        presenter?.getUser()
    }
    
    func setUpView(){
        view.addSubview(userProfileNameLabel)
        userProfileNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        userProfileNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        userProfileNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        userProfileNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(profilePhoto)
        profilePhoto.topAnchor.constraint(equalTo: userProfileNameLabel.bottomAnchor, constant: 20).isActive = true
        profilePhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        profilePhoto.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profilePhoto.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profilePhoto.layer.cornerRadius = 50
        
    }
    
    func displayUserInfo(userData: UserSavedData) {
        let url = URL(string: userData.urlString)
        profilePhoto.sd_setImage(with: url)
    }
    
    
}
