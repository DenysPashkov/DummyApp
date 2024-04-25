//
//  ContentView.swift
//  dummyApp
//
//  Created by denys pashkov on 25/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var scoreManager = ScoreManager()

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                logo()
                highscoreSubview()
                startGameButton()
            }
            .backgroundColor()
            .onAppear {
                scoreManager.loadScore()
            }
        }
    }
    
    @ViewBuilder func logo() -> some View {
        Image("channels4_profile")
            .resizable()
            .frame(height: 150)
            .scaledToFit()
            .padding(.horizontal, 60)
    }
    
    @ViewBuilder func highscoreSubview() -> some View {
        VStack {
            Text("Highscore")
                .bold()
            Text("\(scoreManager.score) Punti")
        }
        .foregroundStyle(.white)
        .font(.title2)
    }
    
    @ViewBuilder func startGameButton() -> some View {
        NavigationLink {
            QuestionView()
                .navigationBarBackButtonHidden()
        } label: {
            Text("Start")
                .foregroundStyle(.white)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background{ Color.startButtonColor }
                .cornerRadius(10)
                .padding(.horizontal, 40)
        }
    }
}

#Preview {
    ContentView()
}
