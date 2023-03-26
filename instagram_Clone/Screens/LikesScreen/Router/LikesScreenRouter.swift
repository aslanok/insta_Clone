//
//  LikesScreenRouter.swift
//  instagram_Clone
//
//  Created by MacBook on 26.03.2023.
//

import UIKit

protocol LikesScreenRouting{
    
}

class LikesScreenRouter : LikesScreenRouting{
    
    var viewController : UIViewController{
        let view = LikesScreenViewController()
        
        return view
    }
    
    
}
