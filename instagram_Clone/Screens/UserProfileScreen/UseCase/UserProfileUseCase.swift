//
//  UserProfileUseCase.swift
//  instagram_Clone
//
//  Created by MacBook on 19.03.2023.
//

import UIKit
import Firebase

protocol UserProfileUseCaseInput {
    func getUserExecute()
}

protocol UserProfileUseCaseOutput {
    func setGetUserSuccess(data : UserSavedData)
    func setGetUserFailed(errorMessage : String)
}

class UserProfileUseCase : UserProfileUseCaseInput {
    internal var output : UserProfileUseCaseOutput?

    func getUserExecute() {
        
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        
        Firestore.firestore().collection("Users").document(currentUserId).getDocument { [self] (snapshot, error) in
            if let error = error {
                output?.setGetUserFailed(errorMessage: error.localizedDescription)
            } else {
                guard let userData = snapshot?.data() else {return }
                let data = UserSavedData(nickName: userData["NickName"] as! String , userId: userData["UserId"] as! String, urlString: userData["ImageUrl"] as! String)
                output?.setGetUserSuccess(data : data)
            }
            
        }
        
    }
    
}
