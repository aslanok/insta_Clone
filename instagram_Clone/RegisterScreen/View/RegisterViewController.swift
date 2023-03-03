//
//  RegisterViewController.swift
//  instagram_Clone
//
//  Created by MacBook on 4.03.2023.
//

import UIKit

protocol RegisterViewContract : UIViewController{
    
}

class RegisterViewController : UIViewController, RegisterViewContract {
    
    var presenter : RegisterPresentation?
    
    private lazy var addPhotoButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "choosePhoto"), for: .normal)
        return button
    }()
    
    private lazy var emailTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your email adress"
        textField.backgroundColor = UIColor(white: 0, alpha: 0.05)
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 16)
        return textField
    }()
    
    private lazy var nickNameTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your nick"
        textField.backgroundColor = UIColor(white: 0, alpha: 0.05)
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 16)
        return textField
    }()
    
    private lazy var passwordTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your password"
        textField.backgroundColor = UIColor(white: 0, alpha: 0.05)
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 16)
        return textField
    }()
    
    private lazy var registerButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.backgroundColor = UIColor(red: 150/255, green: 205/255, blue: 245/255, alpha: 1.0)
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(addPhotoButton)
        addPhotoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        addPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addPhotoButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        addPhotoButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        view.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: addPhotoButton.bottomAnchor, constant: 20).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(nickNameTextField)
        nickNameTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10).isActive = true
        nickNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45).isActive = true
        nickNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45).isActive = true
        nickNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: nickNameTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(registerButton)
        registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
                
    }
    
}
