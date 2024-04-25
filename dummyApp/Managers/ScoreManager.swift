//
//  ScoreManager.swift
//  dummyApp
//
//  Created by denys pashkov on 25/04/24.
//

import Foundation

class ScoreManager: ObservableObject {
    @Published var score: Int = 0
    
    init() {
        loadScore()
    }
    
    // Function to get the score
    func getScore() -> Int {
        loadScore()
        return score
    }
    
    // Function to save the score
    func saveScore(newScore: Int) {
        loadScore()
        if score > newScore { return }
        UserDefaults.standard.set(newScore, forKey: "gameScore")
    }
    
    // Function to load the score
    func loadScore() {
        if let savedScore = UserDefaults.standard.value(forKey: "gameScore") as? Int {
            score = savedScore
        }
    }
}
