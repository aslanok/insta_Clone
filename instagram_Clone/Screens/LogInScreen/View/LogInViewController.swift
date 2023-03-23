//
//  LogInViewController.swift
//  instagram_Clone
//
//  Created by MacBook on 23.03.2023.
//

import UIKit
import JGProgressHUD

protocol LogInViewContract : UIViewController {
    func displayLogInSuccess()
}

class LogInViewController : UIViewController, LogInViewContract{
    
    var presenter : LogInPresentation?
    
    var hud = JGProgressHUD(style: .light)
    
    private lazy var notRegisterButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let attrString = NSMutableAttributedString(string: "Not Register Yet! ", attributes: [
            .font : UIFont.systemFont(ofSize: 16),
            .foregroundColor : UIColor.lightGray
        ])
        attrString.append(NSAttributedString(string: "Register for click", attributes: [
            .font : UIFont.boldSystemFont(ofSize: 16),
            .foregroundColor : UIColor.systemBlue
        ]))
        button.setAttributedTitle(attrString, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var instaLogo : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "instaLogo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var logoBackgroundView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0, green: 120/255, blue: 175/255, alpha: 1.0)
        return view
    }()
    
    private lazy var emailTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your email adress"
        textField.backgroundColor = UIColor(white: 0, alpha: 0.05)
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.setLeftPaddingPoints(10)
        return textField
    }()
    
    private lazy var passwordTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your password"
        textField.backgroundColor = UIColor(white: 0, alpha: 0.05)
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.setLeftPaddingPoints(10)
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var logInButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = UIColor(red: 150/255, green: 205/255, blue: 245/255, alpha: 1.0)
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(logInButtonClicked), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
    }
    
    func setUpView(){
        view.addSubview(logoBackgroundView)
        logoBackgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        logoBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        logoBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        logoBackgroundView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        logoBackgroundView.addSubview(instaLogo)
        instaLogo.centerXAnchor.constraint(equalTo: logoBackgroundView.centerXAnchor).isActive = true
        instaLogo.centerYAnchor.constraint(equalTo: logoBackgroundView.centerYAnchor).isActive = true
        
        view.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: logoBackgroundView.bottomAnchor, constant: 40).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive =  true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive =  true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(logInButton)
        logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive =  true
        logInButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(notRegisterButton)
        notRegisterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        notRegisterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        notRegisterButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        notRegisterButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    @objc func registerButtonPressed(){
        presenter?.presentRegister()
    }
    
    @objc func logInButtonClicked(){
        hud.textLabel.text = "Oturum Açılıyor"
        hud.show(in: self.view)
        if emailTextField.text == "" || passwordTextField.text == "" {
            print("Bilgileri eksiksiz girmeniz gerekiyor")
        } else {
            presenter?.logIn(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        }
    }
    
    func displayLogInSuccess() {
        hud.dismiss(animated: true)
        hud.textLabel.text = "Log In Successfull"
        hud.dismiss(afterDelay: 2, animated: true)
        presenter?.dismiss()
    }
    
}
