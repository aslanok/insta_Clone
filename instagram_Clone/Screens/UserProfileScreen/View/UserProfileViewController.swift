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
    
    private lazy var nickNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nick Name"
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
    
    private lazy var gridButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "gridSign"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private lazy var listButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "listSign"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private lazy var locationButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "locationSign"), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
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
        
        view.addSubview(nickNameLabel)
        nickNameLabel.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 10).isActive = true
        nickNameLabel.leadingAnchor.constraint(equalTo: profilePhoto.leadingAnchor).isActive = true
        
        stackView.addArrangedSubview(gridButton)
        stackView.addArrangedSubview(listButton)
        stackView.addArrangedSubview(locationButton)
        
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: nickNameLabel.bottomAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    func displayUserInfo(userData: UserSavedData) {
        userProfileNameLabel.text = userData.nickName
        nickNameLabel.text = userData.nickName
        let url = URL(string: userData.urlString)
        profilePhoto.sd_setImage(with: url)
    }
    
    
}
