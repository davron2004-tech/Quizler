//
//  QuizViewController.swift
//  Quizler
//
//  Created by Davron Abdukhakimov on 06/07/23.
//

import UIKit

class QuizViewController: UIViewController {
    var questions = [questionModel]()
    var order = 0
    var score = 0
    var topic = ""
    var number = ""
    var difficulty = ""
    var type = ""
    var question: questionModel?
    @IBOutlet weak var questionTextLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if type == "True/False"{
            button1.setTitle("True", for: .normal)
            button2.setTitle("False", for: .normal)
            button3.isHidden = true
            button4.isHidden = true
        }
        nextQuestion()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if sender.currentTitle! == question?.correctAnswer{
            score += 1
        }
        if order < Int(number)!{
            nextQuestion()
        }
        else{
            performSegue(withIdentifier: "toResult", sender: self)
        }
    }
    func nextQuestion(){
        question = questions[order]
        scoreLabel.text = "Score: \(score)/\(number)"
        let fixedString = String(htmlEncodedString: (question?.questionText)!)
        questionTextLabel.text = fixedString
        if type == "Multiple Choice"{
            let a = question?.answers.shuffled()
            button1.setTitle(a![0], for: .normal)
            button2.setTitle(a![1], for: .normal)
            button3.setTitle(a![2], for: .normal)
            button4.setTitle(a![3], for: .normal)
        }
        order += 1
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult"{
            let resultVC = segue.destination as! ResultViewController
            resultVC.number = number
            resultVC.score = score
        }
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


extension String {
    init?(htmlEncodedString: String) {
        guard let data = htmlEncodedString.data(using: .utf8) else {
            return nil
        }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return nil
        }
        self.init(attributedString.string)
    }
}
