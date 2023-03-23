//
//  RegisterViewController.swift
//  instagram_Clone
//
//  Created by MacBook on 4.03.2023.
//

import UIKit
import JGProgressHUD

protocol RegisterViewContract : UIViewController{
    func registerCompleted(userId : String)
    func registerFailed()
    func saveDataCompled()
}

class RegisterViewController : UIViewController, RegisterViewContract {
    
    var presenter : RegisterPresentation?
    
    let hud = JGProgressHUD(style: .light)
    
    private lazy var addPhotoButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "choosePhoto"), for: .normal)
        button.addTarget(self, action: #selector(photoAddButtonClicked), for: .touchUpInside)
        return button
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
    
    private lazy var nickNameTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your nick"
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
    
    private lazy var registerButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.backgroundColor = UIColor(red: 150/255, green: 205/255, blue: 245/255, alpha: 1.0)
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var goLogInButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let attrString = NSMutableAttributedString(string: "If you had an account, ", attributes: [
            .font : UIFont.systemFont(ofSize: 16),
            .foregroundColor : UIColor.lightGray
        ])
        attrString.append(NSAttributedString(string: "go LogIn Page", attributes: [
            .font : UIFont.boldSystemFont(ofSize: 16),
            .foregroundColor : UIColor.systemBlue
        ]))
        button.setAttributedTitle(attrString, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(goLogInPressed), for: .touchUpInside)
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
        
        view.addSubview(goLogInButton)
        goLogInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        goLogInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        goLogInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        goLogInButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    @objc func registerButtonPressed(){
        hud.textLabel.text = "Kaydınız Gerçekleşiyor"
        hud.show(in: self.view)
        if emailTextField.text == "" || passwordTextField.text == "" {
            print("Bilgileri eksiksiz girmeniz gerekiyor")
        } else {
            presenter?.signInUser(email: emailTextField.text ?? "", password: passwordTextField.text ?? "", userName: nickNameTextField.text ?? "")
        }
    }
    
    @objc func photoAddButtonClicked(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true)
    }
    
    @objc func goLogInPressed(){
        presenter?.presentLogInPage()
    }
    
    func registerCompleted(userId : String) {        
        let imageName = UUID().uuidString // this give us a random string
        let imageData = self.addPhotoButton.imageView?.image?.jpegData(compressionQuality: 0.8) ?? Data()
        
        presenter?.savePhoto(imageName: imageName, imageData: imageData)
    }
    
    func saveDataCompled() {
        hud.dismiss(animated: true)
        hud.textLabel.text = "Kayıt Başarılı"
        hud.dismiss(afterDelay: 2, animated: true)
        addPhotoButton.setImage(UIImage(named: "choosePhoto"), for: .normal)
        addPhotoButton.layer.borderWidth = 0
        addPhotoButton.layer.borderColor = UIColor.clear.cgColor
        emailTextField.text = ""
        nickNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    func registerFailed() {
        hud.dismiss(animated: true)
    }
    
}

extension RegisterViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imageSelected = info[.originalImage] as? UIImage
        self.addPhotoButton.setImage(imageSelected?.withRenderingMode(.alwaysOriginal), for: .normal)
        addPhotoButton.layer.cornerRadius = addPhotoButton.frame.width / 2
        addPhotoButton.layer.masksToBounds = true
        addPhotoButton.layer.borderColor = UIColor.darkGray.cgColor
        addPhotoButton.layer.borderWidth = 3
        self.dismiss(animated: true)
    }
    
}
