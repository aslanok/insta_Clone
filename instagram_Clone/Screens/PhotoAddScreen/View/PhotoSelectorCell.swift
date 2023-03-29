//
//  PhotoSelectorCell.swift
//  instagram_Clone
//
//  Created by MacBook on 30.03.2023.
//

import UIKit

class PhotoSelectorCell : UICollectionViewCell {
    
    var imagePhoto : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .green
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        
        self.addSubview(imagePhoto)
        imagePhoto.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imagePhoto.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imagePhoto.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imagePhoto.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
