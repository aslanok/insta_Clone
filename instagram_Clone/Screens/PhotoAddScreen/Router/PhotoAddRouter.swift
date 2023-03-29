//
//  PhotoAddRouter.swift
//  instagram_Clone
//
//  Created by MacBook on 26.03.2023.
//

import UIKit

protocol PhotoAddRouting{
    
}

class PhotoAddRouter : PhotoAddRouting{
    
    var viewController : UIViewController{
        let view = PhotoAddViewController()
        
        return view
    }
    
}
