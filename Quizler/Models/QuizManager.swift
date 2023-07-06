//
//  QuizManager.swift
//  iTrivia
//
//  Created by Davron Abdukhakimov on 04/07/23.
//

import UIKit
class QuizManager{
    var questions = [Question]()
    var sortedQuestions = [questionModel]()
    let number:String
    let difficulty:String
    let type:String
    let topic:String
    let delegate:QuizSettingsViewController?
    init(questions: [Question] = [Question](), number: String, difficulty: String, type: String, topic: String,delegate:QuizSettingsViewController) {
        self.number = number
        self.difficulty = difficulty
        self.type = type
        self.topic = topic
        self.delegate = delegate
    }
    var type1: String{
        switch type {
        case "Multiple Choice":
            return "multiple"
        case "True/False":
            return "boolean"
        default:
            return "0"
        }
    }
    var difficulty1:String{
        switch  difficulty{
        case "Easy":
            return "easy"
        case "Medium":
            return "medium"
        case "Hard":
            return "hard"
        default:
            return "0"
        }
    }
    var category: String{
        switch topic {
        case "General Knowledge":
            return "9"
        case "Mythology":
            return "20"
        case "Sports":
            return "21"
        case "Geography":
            return "22"
        case "History":
            return "23"
        case "Politics":
            return "24"
        case "Art":
            return "25"
        case "Celebrities":
            return "26"
        case "Animals":
            return "27"
        case "Vehicles":
            return "28"
        default:
            return "0"
        }
    }
    
    func fetchData(){
        let urlString = "https://opentdb.com/api.php?"
        if let url = URL(string: "\(urlString)amount=\(number)&category=\(category)&difficulty=\(difficulty1)&type=\(type1)"){
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { data, response, error in
                if let e = error{
                    print(e.localizedDescription)
                }
                else{
                    if let safeData = data {
                        self.decodeData(safeData)
                    }
                }
            }
            task.resume()
        }
    }
    func decodeData(_ data:Data){
        let decoder = JSONDecoder()
        do{
            let result = try decoder.decode(QuestionModel.self, from: data)
            print(result.response_code)
            if result.response_code == 1{
                DispatchQueue.main.async {
                    self.delegate?.errorLabel.isHidden = false
                    self.delegate?.errorLabel.text = "Unknown error occured while retrieving data! Please choose another topic!"
                }
            }
            else{
                self.questions = result.results
                for question in self.questions {
                    let a = questionModel(questionText: question.question, correctAnswer: question.correct_answer, incorrectAnswers: question.incorrect_answers)
                    sortedQuestions.append(a)
                }
                delegate?.questions = sortedQuestions
                DispatchQueue.main.async {
                    self.delegate?.performSegue(withIdentifier: "quizStarted", sender: self.delegate)
                }
            }
        }
        catch{
            print(error)
        }
    }
    
    
    
}
