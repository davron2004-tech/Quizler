//
//  SignUpController.swift
//  iTrivia
//
//  Created by Davron Abdukhakimov on 03/07/23.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
struct SignUpController{
    var email = ""
    var password = ""
    var delegate:SignUpViewController?
    func registerUser(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let e = error{
                delegate?.errorLabel.isHidden = false
                delegate?.errorLabel.text = e.localizedDescription
            }
            else{
                print(result!)
                delegate?.performSegue(withIdentifier: "signUpToHomeScreen", sender: delegate)
            }
        }
       
    }
}
