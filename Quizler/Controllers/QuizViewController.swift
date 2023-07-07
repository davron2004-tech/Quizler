//
//  QuizViewController.swift
//  Quizler
//
//  Created by Davron Abdukhakimov on 06/07/23.
//
import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
class QuizViewController: UIViewController {
    var questions = [questionModel]()
    var order = 0
    var score = 0
    var quizOrder = 0
    var topic = ""
    var number = ""
    var difficulty = ""
    var type = ""
    var question: questionModel?
    var userAnswer = ""
    var questionArray = [[String: Any]]()
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
        userAnswer = sender.currentTitle!
        let question2 = [
            "questionText":question?.questionText,
            "correctAnswer":question?.correctAnswer,
            "userAnswer":userAnswer,
            "answers":question?.answers
        ] as [String : Any]
        questionArray.append(question2)
        if userAnswer == question?.correctAnswer{
            score += 1
        }
        if order < Int(number)!{
            nextQuestion()
        }
        else{
            let db = Firestore.firestore()
            let dateCreated = Date().timeIntervalSince1970.rounded()
            db.collection((Auth.auth().currentUser?.email)!).document(String(dateCreated)).setData([
                "topic":topic,
                "difficulty":difficulty,
                "type": type,
                "number": number,
                "score": score,
                "questions": questionArray,
                "dateCreated":dateCreated
            ]) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toResult", sender: self)
            }
        }
    }
    func nextQuestion(){
        question = questions[order]
        scoreLabel.text = "Score: \(score)/\(number)"
        let fixedString = String(htmlEncodedString: (question?.questionText)!)
        questionTextLabel.text = fixedString
        if type == "Multiple Choice"{
            let a = question?.answers.shuffled()
            button1.setTitle(String(htmlEncodedString: a![0]), for: .normal)
            button2.setTitle(String(htmlEncodedString: a![1]), for: .normal)
            button3.setTitle(String(htmlEncodedString: a![2]), for: .normal)
            button4.setTitle(String(htmlEncodedString: a![3]), for: .normal)
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
