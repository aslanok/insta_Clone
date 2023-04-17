//
//  PhotoSharePresenter.swift
//  instagram_Clone
//
//  Created by MacBook on 17.04.2023.
//

import UIKit

protocol PhotoSharePresentation {
    
}

class PhotoSharePresenter : PhotoSharePresentation{
    
    internal var output : PhotoShareViewContract
    let router : PhotoShareRouting
    
    init(router : PhotoShareRouting, view : PhotoShareViewContract){
        self.output = view
        self.router = router
    }
    
    
    
}
