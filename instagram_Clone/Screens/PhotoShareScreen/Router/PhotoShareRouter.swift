//
//  PhotoShareRouter.swift
//  instagram_Clone
//
//  Created by MacBook on 17.04.2023.
//

import UIKit

protocol PhotoShareRouting {
    func dismiss(from view : UIViewController)
}

class PhotoShareRouter : PhotoShareRouting{
    
    func createViewController(image : UIImage?) -> UIViewController {
        let view = PhotoShareViewController(image : image)
        let presenter = PhotoSharePresenter(router: self, view: view)
        
        view.modalPresentationStyle = .fullScreen
        
        view.presenter = presenter
        presenter.output = view
        return view
    }
    
    func dismiss(from view: UIViewController) {
        view.dismiss(animated: true)
    }
    
}
