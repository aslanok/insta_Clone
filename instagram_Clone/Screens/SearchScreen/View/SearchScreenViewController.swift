//
//  SearchScreenViewController.swift
//  instagram_Clone
//
//  Created by MacBook on 26.03.2023.
//

import UIKit

protocol SearchScreenViewContract{
    
}

class SearchScreenViewController : UIViewController ,SearchScreenViewContract{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("search screen açıldı")
    }
    
}
