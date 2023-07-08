//
//  LogInController.swift
//  iTrivia
//
//  Created by Davron Abdukhakimov on 03/07/23.
//
import FirebaseAuth

struct LogInController{
    var email = ""
    var password = ""
    var delegate:LogInViewController?
    func checkUser(){
        Auth.auth().signIn(withEmail: email, password: password) {result, error in
            if let e = error{
                delegate?.errorLabel.isHidden = false
                delegate?.errorLabel.text = e.localizedDescription
            }
            else{
                delegate?.performSegue(withIdentifier: "logInToHomeScreen", sender: delegate)
            }
        }
    }

}
