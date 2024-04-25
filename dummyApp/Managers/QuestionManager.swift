//
//  Questions.swift
//  dummyApp
//
//  Created by denys pashkov on 25/04/24.
//

import Foundation

class QuestionManager {
    public func getQuestions() -> [Question] {
        let questions: [Question] = [
            Question(question: "Qual è la capitale dell'Italia?", image: nil, answers: ["Roma", "Milano", "Napoli", "Firenze"], correctAnswerIndex: 0, points: 100),
            Question(question: "Quanto fa 2 + 2?", image: nil, answers: ["3", "4", "5", "6"], correctAnswerIndex: 1, points: 50),
            Question(question: "Chi scrisse 'La Divina Commedia'?", image: nil, answers: ["Dante Alighieri", "Giovanni Boccaccio", "Petrarca", "Ugo Foscolo"], correctAnswerIndex: 0, points: 80),
            Question(question: "In quale anno iniziò la Seconda Guerra Mondiale?", image: nil, answers: ["1939", "1914", "1945", "1918"], correctAnswerIndex: 0, points: 120),
            Question(question: "Qual è il simbolo chimico dell'oro?", image: nil, answers: ["Ag", "Cu", "Au", "Fe"], correctAnswerIndex: 2, points: 90),
            Question(question: "Quale pianeta è conosciuto come 'Il pianeta rosso'?", image: nil, answers: ["Giove", "Marte", "Venere", "Saturno"], correctAnswerIndex: 1, points: 70),
            Question(question: "Chi dipinse 'La Gioconda'?", image: nil, answers: ["Leonardo da Vinci", "Michelangelo", "Raffaello", "Donatello"], correctAnswerIndex: 0, points: 110),
            Question(question: "Qual è l'opposto di 'amore'?", image: nil, answers: ["Odio", "Pace", "Felicità", "Indifferenza"], correctAnswerIndex: 0, points: 100),
            Question(question: "Chi scrisse 'Il Piccolo Principe'?", image: nil, answers: ["Antoine de Saint-Exupéry", "Jules Verne", "Mark Twain", "Charles Dickens"], correctAnswerIndex: 0, points: 90),
            Question(question: "Chi è l'autore del romanzo '1984'?", image: nil, answers: ["George Orwell", "Ray Bradbury", "Aldous Huxley", "F. Scott Fitzgerald"], correctAnswerIndex: 0, points: 100)
        ]
        
        return questions
    }
}
