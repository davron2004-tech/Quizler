//
//  HistoryQuestionsViewController.swift
//  Quizler
//
//  Created by Davron Abdukhakimov on 07/07/23.
//

import UIKit

class HistoryQuestionsViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    var questions = [[String:Any]]()
    var order = 0
    var type = ""
    @IBOutlet weak var previousButtonOutlet: UIButton!
    
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Quizler"
        if type == "True/False"{
            button1.setTitle("True", for: .normal)
            button2.setTitle("False", for: .normal)
            button3.isHidden = true
            button4.isHidden = true
        }
        previousButtonOutlet.alpha = 0.5
        previousButtonOutlet.isEnabled = false
        getQuestion()
        // Do any additional setup after loading the view.
    }
    
    func getQuestion(){
        button1.backgroundColor = UIColor.white
        button2.backgroundColor = UIColor.white
        button3.backgroundColor = UIColor.white
        button4.backgroundColor = UIColor.white
        let question = questions[order]
        if let questionText = question["questionText"] as? String{
            questionLabel.text = String(htmlEncodedString: questionText)
        }
        let a = question["answers"] as! [String]
        if type == "Multiple Choice"{
            button1.setTitle(String(htmlEncodedString: a[0]), for: .normal)
            button2.setTitle(String(htmlEncodedString: a[1]), for: .normal)
            button3.setTitle(String(htmlEncodedString: a[2]), for: .normal)
            button4.setTitle(String(htmlEncodedString: a[3]), for: .normal)
        }
        if button1.currentTitle == question["correctAnswer"] as! String{
            button1.backgroundColor = UIColor.green
        }
        if button2.currentTitle == question["correctAnswer"] as! String{
            button2.backgroundColor = UIColor.green
        }
        if button3.currentTitle == question["correctAnswer"] as! String{
            button3.backgroundColor = UIColor.green
        }
        if button4.currentTitle == question["correctAnswer"] as! String{
            button4.backgroundColor = UIColor.green
        }
        if button1.currentTitle == question["userAnswer"] as! String{
            if question["userAnswer"] as! String != question["correctAnswer"] as! String{
                button1.backgroundColor = UIColor.red
            }
        }
        if button2.currentTitle == question["userAnswer"] as! String{
            if question["userAnswer"] as! String != question["correctAnswer"] as! String{
                button2.backgroundColor = UIColor.red
            }
        }
        if button3.currentTitle == question["userAnswer"] as! String{
            if question["userAnswer"] as! String != question["correctAnswer"] as! String{
                button3.backgroundColor = UIColor.red
            }
        }
        if button4.currentTitle == question["userAnswer"] as! String{
            if question["userAnswer"] as! String != question["correctAnswer"] as! String{
                button4.backgroundColor = UIColor.red
            }
        }

        
    }
    @IBAction func previousPressed(_ sender: UIButton) {
        nextButtonOutlet.alpha = 1
        nextButtonOutlet.isEnabled = true
        order -= 1
        if order == 0{
            previousButtonOutlet.alpha = 0.5
            previousButtonOutlet.isEnabled = false
        }
        getQuestion()
    }
    
    
    @IBAction func nextPressed(_ sender: UIButton) {
        previousButtonOutlet.alpha = 1
        previousButtonOutlet.isEnabled = true
        order += 1
        if order == questions.count - 1{
            nextButtonOutlet.alpha = 0.5
            nextButtonOutlet.isEnabled = false
        }
        getQuestion()
    }
    
}
