//
//  MidLabelComponent.swift
//  instagram_Clone
//
//  Created by MacBook on 21.03.2023.
//

import UIKit

class MidLabelComponent : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .center
    }
    
    
    
}
