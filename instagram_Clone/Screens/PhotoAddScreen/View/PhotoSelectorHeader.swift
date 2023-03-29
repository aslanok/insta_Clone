//
//  PhotoSelectorHeader.swift
//  instagram_Clone
//
//  Created by MacBook on 30.03.2023.
//

import UIKit

class PhotoSelectorHeader : UICollectionViewCell{
    
    let imageHeader : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .purple
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageHeader)
        imageHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageHeader.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageHeader.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageHeader.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive =  true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
