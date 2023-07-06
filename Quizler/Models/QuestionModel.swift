//
//  QuestionModel.swift
//  iTrivia
//
//  Created by Davron Abdukhakimov on 04/07/23.
//

import Foundation
struct QuestionModel:Decodable{
    let response_code:Int
    let results:[Question]
}
struct Question:Decodable{
    let question:String
    let correct_answer:String
    let incorrect_answers:[String]
    
}
struct questionModel{
    let questionText:String
    let correctAnswer:String
    let incorrectAnswers:[String]
    var answers:[String]{
        var a:[String] = []
        for answer in incorrectAnswers {
            a.append(answer)
        }
        a.append(correctAnswer)
        return a
    }
}
