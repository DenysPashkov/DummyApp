//
//  Question.swift
//  dummyApp
//
//  Created by denys pashkov on 25/04/24.
//

import SwiftUI

struct Question {
    let question: String
    let image: String?
    let answers: [String]
    let correctAnswerIndex: Int
    let points: Int
}
