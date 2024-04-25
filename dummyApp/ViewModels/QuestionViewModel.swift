//
//  QuestionViewModel.swift
//  dummyApp
//
//  Created by denys pashkov on 25/04/24.
//

import Foundation
import SwiftUI

class QuestionViewModel: ObservableObject {
    
    @Published var currentQuestionIndex: Int = 0
    @Published var score = 0
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    @Published var selectedAnswer: Int?
    @Published var roundFinished: Bool = false
    
    @Published var goBack: Bool = false
    
    let questions: [Question]
    
    init() {
        questions = QuestionManager().getQuestions()
    }
    
    func cellBackgroundColor(idx: Int) -> Color {
        if idx == questions[currentQuestionIndex].correctAnswerIndex && selectedAnswer != nil {
            return .green
        }
        
        if idx == selectedAnswer {
            return .red
        }
        
        return .white
    }
    
    func checkAnswer(idx: Int) {
        selectedAnswer = idx
        roundFinished.toggle()
        
        if idx == questions[currentQuestionIndex].correctAnswerIndex {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { [self] in
                self.score += self.questions[self.currentQuestionIndex].points
                self.nextQuestion()
            })
        } else {
            let question = questions[currentQuestionIndex]
            let correctIdx = question.correctAnswerIndex
            let correctAnswer = question.answers[correctIdx]
            alertMessage = "La risposta corretta è \(correctAnswer)"
            showAlert.toggle()
        }
    }
    
    func nextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            ScoreManager().saveScore(newScore: score)
            score = 0
            currentQuestionIndex = 0
            goBack.toggle()
        }
        
        selectedAnswer = nil
        roundFinished.toggle()
    }
    
    func createAlert() -> Alert {
        let alert = Alert(title: Text("Risposta errata"), message: Text(alertMessage), dismissButton: .default(Text("OK")) {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.nextQuestion()
            })
        })
        return alert
    }
    
    // MARK: questions utils
    func getQuestionPoints() -> Int {
        return questions[currentQuestionIndex].points
    }
    
    func getQuestionImage() -> String? {
        return questions[currentQuestionIndex].image
    }
    
    func getCurrentQuestion() -> String {
        return questions[currentQuestionIndex].question
    }
    
    func getCurrentQuestionAnswer(idx: Int) -> String {
        return questions[currentQuestionIndex].answers[idx]
    }
}
