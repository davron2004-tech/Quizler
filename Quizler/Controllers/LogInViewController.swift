//
//  LogInViewController.swift
//  Quizler
//
//  Created by Davron Abdukhakimov on 05/07/23.
//

import UIKit
class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    var logInController = LogInController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Quizler"
        errorLabel.isHidden = true
        logInController.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
        logInController.delegate = self
        logInController.email = emailTextField.text!
        logInController.password = passwordTextField.text!
        logInController.checkUser()
    }

}
