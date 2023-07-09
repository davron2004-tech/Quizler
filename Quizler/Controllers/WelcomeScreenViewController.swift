//
//  WelcomeScreenViewController.swift
//  Quizler
//
//  Created by Davron Abdukhakimov on 05/07/23.
//

import UIKit
class WelcomeScreenViewController: UIViewController {

    @IBOutlet weak var quizlerLabel: CLTypingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        quizlerLabel.text = "Quizler"
        self.title = "Quizler"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
    }
    

}
