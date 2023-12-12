//
//  FirebaseManager.swift
//  AuthFirebase
//
//  Created by Sherozbek on 11/12/23.
//

import Foundation
import Firebase

class FirebaseManager{
    
    
    func registerNewUser(user: UserData){
        Auth.auth().createUser(withEmail: user.email, password: user.password) { result , error in
            guard error == nil else { 
                print(error?.localizedDescription)
                return }
            result?.user.sendEmailVerification()
            print(result?.user.uid)
        }
    }
    
}


struct UserData{
    var name: String
    var email: String
    var password: String
}
