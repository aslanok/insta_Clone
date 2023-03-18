//
//  UserProfileViewController.swift
//  instagram_Clone
//
//  Created by MacBook on 18.03.2023.
//

import UIKit

protocol UserProfileViewContract : UIViewController {
    
}

class UserProfileViewController : UIViewController, UserProfileViewContract {
    
    internal var presenter : UserProfilePresentation?
    
    private lazy var profileTextLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "User Profile"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpView()
        
        presenter?.getUser()
    }
    
    func setUpView(){
        view.addSubview(profileTextLabel)
        profileTextLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        profileTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        profileTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        profileTextLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
}
