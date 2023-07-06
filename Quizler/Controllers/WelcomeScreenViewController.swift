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
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
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
