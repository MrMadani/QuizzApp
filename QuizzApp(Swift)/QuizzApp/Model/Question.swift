//
//  Question.swift
//  QuizzApp
//
//  Created by shahinmadani on 1/7/21.
//

import Foundation
class Question{
    let questionText : String
    let answer : Bool
    init(text: String, correctAnswer: Bool) {
        self.questionText = text
        self.answer = correctAnswer
    }
}
