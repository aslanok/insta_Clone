//
//  HomeViewController.swift
//  instagram_Clone
//
//  Created by MacBook on 26.03.2023.
//

import UIKit


protocol HomeViewContract {
    
}

class HomeViewController : UIViewController, HomeViewContract {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("ana ekran açıldı")
    }
    
}
