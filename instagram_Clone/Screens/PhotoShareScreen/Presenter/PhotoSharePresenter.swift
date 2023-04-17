//
//  PhotoSharePresenter.swift
//  instagram_Clone
//
//  Created by MacBook on 17.04.2023.
//

import UIKit

protocol PhotoSharePresentation {
    func dismiss()
    func savePhoto(imageName : String, imageData: Data)
}

class PhotoSharePresenter : PhotoSharePresentation, PhotoShareUseCaseOutput{
    
    internal var output : PhotoShareViewContract
    let router : PhotoShareRouting
    private var photoShareUseCase : PhotoShareUseCaseInput
    
    init(router : PhotoShareRouting, view : PhotoShareViewContract, photoShareCase: PhotoShareUseCaseInput){
        self.output = view
        self.router = router
        self.photoShareUseCase = photoShareCase
    }
    
    func dismiss() {
        router.dismiss(from: output as! UIViewController)
    }
    
    func savePhoto(imageName: String, imageData: Data){
        photoShareUseCase.savePhotoExecute(imageName: imageName, imageData: imageData)
    }
    
    
    func setSavePhotoSuccess() {
        
    }
    
    func setSavePhotoFailed(errorMessage: String) {
        
    }
    
    func getDownloadURLSuccess(url: String) {
        
    }
    
    func getDownloadURLFailed(errorMessage: String) {
        
    }
    
    
}
