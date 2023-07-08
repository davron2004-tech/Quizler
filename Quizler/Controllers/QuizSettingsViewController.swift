//
//  QuizSettingsViewController.swift
//  Quizler
//
//  Created by Davron Abdukhakimov on 05/07/23.
//

import UIKit

class QuizSettingsViewController: UIViewController{
    var topic = ""
    var questionType = "Multiple Choice"
    var number = ""
    var questionDifficulty = "Easy"
    var questions = [questionModel]()
   
    @IBOutlet weak var numberOfQuestionsTextField: UITextField!
    
    @IBOutlet weak var difficultyPicker: UIPickerView!
    
    @IBOutlet weak var typePicker: UIPickerView!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    let difficulty = ["Easy","Medium","Hard"]
    let type = ["Multiple Choice", "True/False"]
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        difficultyPicker.delegate = self
        difficultyPicker.dataSource = self
        typePicker.delegate = self
        typePicker.dataSource = self
        stepper.minimumValue = 1
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numberStepper(_ sender: UIStepper) {
        numberOfQuestionsTextField.text = Int(stepper.value).description
        
    }
    
    @IBAction func startQuizPressed(_ sender: UIButton) {
        number = numberOfQuestionsTextField.text!
        let quizManager = QuizManager(number: number, difficulty: questionDifficulty, type: questionType, topic: topic,delegate: self)
        quizManager.fetchData()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quizStarted"{
            let  quizVC = segue.destination as! QuizViewController
            quizVC.questions = self.questions
            quizVC.difficulty = questionDifficulty
            quizVC.topic = self.topic
            quizVC.type = questionType
            quizVC.number = self.number
        }
    }
    

}


extension QuizSettingsViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return 3
        }
        else{
            return 2
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return difficulty[row]
        }
        else{
            return type[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
            questionDifficulty = difficulty[row]
        }
        else{
            questionType = type[row]
        }
    }
    
}
