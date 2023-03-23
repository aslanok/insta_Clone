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
    private var _userId : String = ""
    
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
    
    private lazy var midButtonsStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var topLabelsStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var bottomLabelsStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var postNumberLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var followerNumberLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var followNumberLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "20"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var userPostNumberLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Paylaşım"
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var userFollowerNumberLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Takipçi"
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var userFollowNumberLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Takip"
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var editProfileButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Profili Düzenle", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }()
    
    private lazy var line1 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var line2 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var collectionView : UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentMode = .scaleAspectFit
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UserProfilePostCell.self, forCellWithReuseIdentifier: UserProfilePostCell.identifier)
        return collectionView
    }()
    
    private lazy var logOutButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(logOutButtonClicked), for: .touchUpInside)
        button.setImage(UIImage(named: "setting"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
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
        
        midButtonsStackView.addArrangedSubview(gridButton)
        midButtonsStackView.addArrangedSubview(listButton)
        midButtonsStackView.addArrangedSubview(locationButton)
        
        view.addSubview(midButtonsStackView)
        midButtonsStackView.topAnchor.constraint(equalTo: nickNameLabel.bottomAnchor, constant: 20).isActive = true
        midButtonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        midButtonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        midButtonsStackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        topLabelsStackView.addArrangedSubview(postNumberLabel)
        topLabelsStackView.addArrangedSubview(followerNumberLabel)
        topLabelsStackView.addArrangedSubview(followNumberLabel)
        
        view.addSubview(topLabelsStackView)
        topLabelsStackView.topAnchor.constraint(equalTo: profilePhoto.topAnchor, constant: 5).isActive = true
        topLabelsStackView.leadingAnchor.constraint(equalTo: profilePhoto.trailingAnchor, constant: 10).isActive = true
        topLabelsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        topLabelsStackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        bottomLabelsStackView.addArrangedSubview(userPostNumberLabel)
        bottomLabelsStackView.addArrangedSubview(userFollowerNumberLabel)
        bottomLabelsStackView.addArrangedSubview(userFollowNumberLabel)
        
        view.addSubview(bottomLabelsStackView)
        bottomLabelsStackView.topAnchor.constraint(equalTo: topLabelsStackView.bottomAnchor).isActive = true
        bottomLabelsStackView.leadingAnchor.constraint(equalTo: topLabelsStackView.leadingAnchor).isActive = true
        bottomLabelsStackView.trailingAnchor.constraint(equalTo: topLabelsStackView.trailingAnchor).isActive = true
        bottomLabelsStackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(editProfileButton)
        editProfileButton.leadingAnchor.constraint(equalTo: topLabelsStackView.leadingAnchor, constant: 0).isActive = true
        editProfileButton.trailingAnchor.constraint(equalTo: topLabelsStackView.trailingAnchor, constant: 0).isActive = true
        editProfileButton.topAnchor.constraint(equalTo: bottomLabelsStackView.bottomAnchor, constant: 10).isActive = true
        editProfileButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(line1)
        line1.bottomAnchor.constraint(equalTo: gridButton.topAnchor, constant: -5).isActive = true
        line1.heightAnchor.constraint(equalToConstant: 2).isActive = true
        line1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        line1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true

        view.addSubview(line2)
        line2.topAnchor.constraint(equalTo: gridButton.bottomAnchor,constant: 5).isActive = true
        line2.heightAnchor.constraint(equalToConstant: 2).isActive = true
        line2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        line2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: line2.bottomAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        view.addSubview(logOutButton)
        logOutButton.centerYAnchor.constraint(equalTo: userProfileNameLabel.centerYAnchor, constant: 0).isActive = true
        logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        logOutButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        logOutButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    @objc func logOutButtonClicked(){
        print("oturum kapat")
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let actionLogOut = UIAlertAction(title: "Log Out", style: .destructive, handler: { action in
            self.logOutPressed()
        })
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            
        })
        alertController.addAction(actionLogOut)
        alertController.addAction(actionCancel)
        self.present(alertController,animated: true, completion: nil)
    }
    
    func logOutPressed(){
        presenter?.logOut()
    }
    
    func displayUserInfo(userData: UserSavedData) {
        _userId = userData.userId
        userProfileNameLabel.text = userData.nickName
        nickNameLabel.text = userData.nickName
        let url = URL(string: userData.urlString)
        profilePhoto.sd_setImage(with: url)
    }
}

extension UserProfileViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserProfilePostCell.identifier, for: indexPath) as? UserProfilePostCell {
            cell.setUp()
            return cell
        }
        return UICollectionViewCell()
    }
    
}

extension UserProfileViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.size.width / 3) - 10 , height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}

extension UserProfileViewController : UICollectionViewDelegate {
    
}
