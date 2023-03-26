//
//  PhotoAddViewController.swift
//  instagram_Clone
//
//  Created by MacBook on 26.03.2023.
//

import UIKit

protocol PhotoAddViewContract{
    
}

class PhotoAddViewController : UIViewController, PhotoAddViewContract{
    
    private lazy var backButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setImage(UIImage(named: "arrowLeft"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("discover screen opeend")
        
        setUpView()
        
    }
    
    func setUpView(){
        view.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
    }
    
    
    @objc func backButtonTapped(){
        print("back Tapped")
    }
    
}
