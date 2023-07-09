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
        self.title = "Quizler"
        resultLabel.text = "\(score)/\(number)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func newQuizPressed(_ sender: UIButton) {
    }
    

}
