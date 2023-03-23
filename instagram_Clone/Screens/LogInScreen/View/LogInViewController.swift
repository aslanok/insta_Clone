//
//  LogInViewController.swift
//  instagram_Clone
//
//  Created by MacBook on 23.03.2023.
//

import UIKit

protocol LogInViewContract : UIViewController {
    
}

class LogInViewController : UIViewController, LogInViewContract{
    
    var presenter : LogInPresentation?
    
    private lazy var registerButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Not Register Yet! Click for register", for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
    }
    
    func setUpView(){
        view.addSubview(registerButton)
        registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    
    @objc func registerButtonPressed(){
        print("register clicked")
        presenter?.presentRegister()
    }
    
    
    
}
