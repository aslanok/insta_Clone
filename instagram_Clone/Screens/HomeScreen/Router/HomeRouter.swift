//
//  HomeScreenRouter.swift
//  instagram_Clone
//
//  Created by MacBook on 26.03.2023.
//

import Foundation
import UIKit

protocol HomeRouting{
    
}

class HomeRouter : HomeRouting {
    
    var viewController : UIViewController {
        let view = HomeViewController()
        
        
        return view
    }
    
}
