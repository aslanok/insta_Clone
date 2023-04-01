//
//  PhotoAddViewController.swift
//  instagram_Clone
//
//  Created by MacBook on 26.03.2023.
//

import UIKit
import Photos

protocol PhotoAddViewContract{
    
}

class PhotoAddViewController : UIViewController, PhotoAddViewContract, UICollectionViewDelegate, UICollectionViewDataSource{
    
    private var assetsArray : [PHAsset] = [PHAsset]()
    private var photosArray : [UIImage] = [UIImage]()
    private var selectedPhoto : UIImage?
    
    private lazy var backButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setImage(UIImage(named: "arrowLeft"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var collectionView : UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PhotoSelectorCell.self, forCellWithReuseIdentifier: "addPhotoCell")
        collectionView.register(PhotoSelectorHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("discover screen opeend")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setUpView()
        getPhotos()
    }
    
    func setUpView(){
        view.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        
    }
    
    func getPhotos(){
        let fetchOptions = PHFetchOptions()
        fetchOptions.fetchLimit = 10
        
        let orderOption = NSSortDescriptor(key: "creationDate", ascending: false)
        fetchOptions.sortDescriptors = [orderOption]
        
        let photos = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        
        photos.enumerateObjects { asset, number, stop in
            // in asset photo infos contains
            // number is the num of photo around 0-9
            let imageManager = PHImageManager.default()
            let sizeOfPhoto = CGSize(width: 200, height: 200)
            let options = PHImageRequestOptions()
            options.isSynchronous = true
            imageManager.requestImage(for: asset, targetSize: sizeOfPhoto, contentMode: .aspectFit, options: options) { photo, photoInfos in
                if let photo = photo {
                    self.assetsArray.append(asset)
                    self.photosArray.append(photo)
                    
                    if self.selectedPhoto == nil {
                        self.selectedPhoto = photo
                    }
                    
                }
                if number == self.photosArray.count - 1{
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    @objc func backButtonTapped(){
        print("back Tapped")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as! PhotoSelectorHeader
        header.imageHeader.image = selectedPhoto
        if let selectedPhoto = selectedPhoto {
            if let index = self.photosArray.firstIndex(of: selectedPhoto){
                let selectedAsset = self.assetsArray[index]
                let photoManager = PHImageManager.default()
                let size = CGSize(width: 600, height: 600)
                photoManager.requestImage(for: selectedAsset, targetSize: size, contentMode: .default, options: nil) { photo, info in
                    header.imageHeader.image = photo
                }
                
            }
        }
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addPhotoCell", for: indexPath) as! PhotoSelectorCell
        cell.imagePhoto.image = photosArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPhoto = photosArray[indexPath.row]
        collectionView.reloadData()
        print(selectedPhoto)
    }
    
}

extension PhotoAddViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width-3)/4 , height: (UIScreen.main.bounds.width-3)/4 )
    }
    // this code block is used for giving space for between header and cell section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 0, bottom: 0, right: 0)
    }
    
    
}
