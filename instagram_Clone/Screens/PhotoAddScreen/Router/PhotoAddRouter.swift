//
//  PhotoAddRouter.swift
//  instagram_Clone
//
//  Created by MacBook on 26.03.2023.
//

import UIKit

protocol PhotoAddRouting{
    func presentPhotoShareScreen(from view: UIViewController, image : UIImage?)
}

class PhotoAddRouter : PhotoAddRouting{
    
    var viewController : UIViewController{
        let view = PhotoAddViewController()
        let presenter = PhotoAddPresenter(router: self, view: view)
        
        view.presenter = presenter
        presenter.output = view
        return view
    }
    
    func presentPhotoShareScreen(from view: UIViewController, image : UIImage?) {
        view.present(PhotoShareRouter().createViewController(image: image), animated: true)
    }
    
    
    
}
