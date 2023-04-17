//
//  PhotoShareUseCase.swift
//  instagram_Clone
//
//  Created by MacBook on 17.04.2023.
//

import UIKit
import Firebase

protocol PhotoShareUseCaseInput {
    func savePhotoExecute(imageName : String, imageData : Data)
    func getDownloadURLExecute(ref : StorageReference)
}

protocol PhotoShareUseCaseOutput{
    func setSavePhotoSuccess()
    func setSavePhotoFailed(errorMessage : String)
    func getDownloadURLSuccess(url : String)
    func getDownloadURLFailed(errorMessage : String)
}

class PhotoShareUseCase : PhotoShareUseCaseInput{
    internal var output : PhotoShareUseCaseOutput?
    
    func savePhotoExecute(imageName : String, imageData : Data){
        let ref = Storage.storage().reference(withPath: "/Posts/\(imageName)")
        ref.putData(imageData, metadata: nil){ success, error in
            if let error = error {
                self.output?.setSavePhotoFailed(errorMessage: error.localizedDescription)
            } else {
                self.output?.setSavePhotoSuccess()
            }
        }
    }
    
    func getDownloadURLExecute(ref: StorageReference) {
        ref.downloadURL { [self] url, error in
            if let error = error {
                output?.getDownloadURLFailed(errorMessage: error.localizedDescription)
            } else {
                output?.getDownloadURLSuccess(url: url?.absoluteString ?? "")
            }
        }
    }
}
