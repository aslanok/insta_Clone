//
//  UserProfilePostCell.swift
//  instagram_Clone
//
//  Created by MacBook on 22.03.2023.
//

import UIKit

class UserProfilePostCell : UICollectionViewCell {
    
    static let identifier = "UserProfilePostCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(){
        contentView.backgroundColor = .red
    }
    
}
