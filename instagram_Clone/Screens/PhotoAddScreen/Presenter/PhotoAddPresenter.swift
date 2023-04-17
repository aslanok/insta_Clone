//
//  PhotoAddPresenter.swift
//  instagram_Clone
//
//  Created by MacBook on 17.04.2023.
//

import UIKit

protocol PhotoAddPresentation{
    func openPhotoShareScreen(image : UIImage?)
}

class PhotoAddPresenter : PhotoAddPresentation{
    
    internal var output : PhotoAddViewContract
    let router : PhotoAddRouting
    
    init(router : PhotoAddRouting, view : PhotoAddViewContract){
        self.output = view
        self.router = router
    }
    
    func openPhotoShareScreen(image : UIImage? ) {
        router.presentPhotoShareScreen(from: output as! UIViewController, image: image)
    }
    
    
}
