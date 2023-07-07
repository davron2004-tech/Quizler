//
//  SignUpViewController.swift
//  Quizler
//
//  Created by Davron Abdukhakimov on 05/07/23.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    var signUpController = SignUpController()
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        signUpController.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        signUpController.email = emailTextField.text!
        signUpController.password = passwordTextField.text!
        signUpController.registerUser()
    }
    
    

}
