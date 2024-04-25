//
//  QuestionView.swift
//  dummyApp
//
//  Created by denys pashkov on 25/04/24.
//
import SwiftUI

struct QuestionView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm = QuestionViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            header()
                .padding(.top, 50)
            
            question()
            
            answerSection()
            
            Spacer()
        }
        .backgroundColor()
        .alert(isPresented: $vm.showAlert) {
            vm.createAlert()
        }
        .onChange(of: vm.goBack, initial: false) { oldValue, newValue in
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    @ViewBuilder private func header() -> some View {
        HStack {
            Spacer()
            Text("Domanda \(vm.currentQuestionIndex + 1) di \(vm.questions.count) - Puntegio attuale : \(vm.score)")
                .padding(.vertical, 10)
                .foregroundStyle(.black)
            Spacer()
        }
        .background{ Color.white }
    }
    
    @ViewBuilder private func question() -> some View {
        VStack(spacing: 40) {
            Text("\(vm.getQuestionPoints()) punti")
                .foregroundStyle(.green)
                .font(.title)
            if let image = vm.getQuestionImage() {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }
            
            Text(vm.getCurrentQuestion())
        }
        .foregroundStyle(.black)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 15)
        .padding(.horizontal, 10)
        .background{ Color.white }
        .cornerRadius(8)
        .padding(.horizontal, 30)
    }
    
    @ViewBuilder private func answerSection() -> some View {
        VStack(spacing: 10) {
            ForEach(0..<4) { index in
                answerButton(idx: index)
            }
        }
    }
    
    @ViewBuilder private func answerButton(idx: Int) -> some View {
        Button(action: {
            if !vm.roundFinished {
                vm.checkAnswer(idx: idx)
            }
        }) {
            Text(vm.getCurrentQuestionAnswer(idx: idx))
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .padding(.horizontal, 10)
                .background{ vm.cellBackgroundColor(idx: idx) }
                .cornerRadius(8)
                .padding(.horizontal, 30)
        }
    }
}
        
#Preview {
    QuestionView()
}
