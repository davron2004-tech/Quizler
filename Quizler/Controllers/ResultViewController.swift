//
//  ResultViewController.swift
//  Quizler
//
//  Created by Davron Abdukhakimov on 06/07/23.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var score = 0
    var number = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "\(score)/\(number)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func newQuizPressed(_ sender: UIButton) {
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
