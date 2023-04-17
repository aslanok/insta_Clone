//
//  PhotoShareViewController.swift
//  instagram_Clone
//
//  Created by MacBook on 17.04.2023.
//

import UIKit

protocol PhotoShareViewContract {
    
}

class PhotoShareViewController : UIViewController, PhotoShareViewContract{
    
    var presenter : PhotoSharePresentation?
    var image : UIImage?
    
    private lazy var topCardView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var postImageView : UIImageView = {
        let image = UIImage()
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var textView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 14)
        return textView
    }()
    
    private lazy var backButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setImage(UIImage(named: "arrowLeft"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var shareButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Share", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    init(image : UIImage?) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
    }
    
    func setUpView(){
        view.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(shareButton)
        shareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        shareButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
        
        view.addSubview(topCardView)
        topCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        topCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topCardView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        postImageView.image = self.image
        topCardView.addSubview(postImageView)
        postImageView.topAnchor.constraint(equalTo: topCardView.topAnchor, constant: 20).isActive = true
        postImageView.leadingAnchor.constraint(equalTo: topCardView.leadingAnchor, constant: 20).isActive = true
        postImageView.bottomAnchor.constraint(equalTo: topCardView.bottomAnchor, constant: -20).isActive = true
        postImageView.widthAnchor.constraint(equalTo: postImageView.heightAnchor).isActive = true
        
        topCardView.addSubview(textView)
        textView.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: 20).isActive = true
        textView.trailingAnchor.constraint(equalTo: topCardView.trailingAnchor, constant: -20).isActive = true
        textView.topAnchor.constraint(equalTo: postImageView.topAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: postImageView.bottomAnchor).isActive = true
        
    }
    
    @objc func backButtonTapped(){
        print("back Tapped")
    }
    
    @objc func nextButtonTapped(){
        print("next tapped")
    }
    
    
}
