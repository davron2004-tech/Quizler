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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
