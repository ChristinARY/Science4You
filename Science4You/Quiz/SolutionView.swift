//
//  SolutionView.swift
//  Science4You
//
//  Created by apprenant83 on 25/10/2022.
//

import SwiftUI

let scoreWidth: CGFloat = 340    // réglage de la position du score en %
let scrollWidth: CGFloat = 360
let scrollHeight: CGFloat = 560

struct SolutionView: View {
    @ObservedObject var quizVM: QuizVM
    @Binding var displayed: Bool

    var body: some View {
        VStack {
            VStack(spacing: 0) {
            //  TitleView(title: quizVM.quiz.title)
                Text(quizVM.quiz.title)
                    .font(.title2)
                    .bold()
                    .frame(height: 56)
                Spacer(minLength: 10)
                ScrollView {
                    VStack(spacing: thumbPadding) {
                        ForEach(0..<quizVM.quiz.numQuestions(), id: \.self) { index in
                            RecapView(q: quizVM.quiz.questionsArray[index].content, a: quizVM.quiz.questionsArray[index].getSolution(), e: quizVM.quiz.questionsArray[index].explanation, good: quizVM.quiz.questionsArray[index].wasGoodAnswered())
                        }
                    }
                }.frame(height: scrollHeight)
                    .cornerRadius(scrollCornerRadius)
            }
            Spacer(minLength: 16)
            ScoreView(quizVM: quizVM)
       //   Spacer(minLength: 16)
            HStack {
                Button(" Recommencer le quiz", action: {
                    displayed = false
                    quizVM.resetQuiz() })
                    .frame(width: 230, height: 40)
                    .font(.system(size: 16).bold())
                    .background(buttonColor)
                    .foregroundColor(.white)
                    .cornerRadius(radius)
                Spacer()
                Button("Sortir", action: {
                    // enregistrer le score obtenu (pour qu'une pastille de couleur
                    //                              apparaisse sur l'item correspondant)
                    // retourner à l'écran des quizzes
                })
                    .frame(width: 110, height: 40)
                    .font(.system(size: 16).bold())
                    .background(buttonColor)
                    .foregroundColor(.white)
                    .cornerRadius(radius)
            }
        }.padding(sidePadding)
    }
}

struct RecapView: View {
    let q: String
    let a: String
    let e: String
    let good: Bool

    var body: some View {
        let frameColor = good ? Color("true") : Color("false")

        VStack(spacing: thumbPadding) {
            Text(q)
                .bold()
                .padding(thumbPadding)
                .frame(maxWidth: 360)
                .background(frameColor)
                .cornerRadius(thumbCornerRadius)
                .frame(width: scrollWidth)
                .offset(y: thumbPadding)
           VStack(spacing: thumbPadding) {
                Text(a).padding(thumbPadding)
                    .frame(maxWidth: 360)
                    .background(Color("gray1"))
                    .cornerRadius(thumbCornerRadius)
                    .frame(width: scrollWidth - 2*thumbPadding)
               if e.count > 0 {
                   Text(e).padding(thumbPadding)
                       .frame(maxWidth: 360)
                       .background(Color("gray2"))
                       .cornerRadius(thumbCornerRadius - thumbPadding/2)
                       .frame(width: scrollWidth - 4*thumbPadding)
                       .offset(y: -thumbPadding)
               }
            }.background(Color("gray1"))
                .cornerRadius(thumbCornerRadius)
        }.offset(y: -thumbPadding)
            .background(frameColor)
            .cornerRadius(scrollCornerRadius)
    }
}

struct ScoreView: View {
    @ObservedObject var quizVM: QuizVM

    var body: some View {
        let percent = quizVM.numAnsweredQuestions == 0 ? 0.0 : Double(quizVM.numGoodAnswers) / Double(quizVM.numAnsweredQuestions)

        VStack(alignment: .leading, spacing: 0) {
            Text("Taux de réussite:")
            LinearGradient(colors: [.red, .yellow, .green],
                           startPoint: .leading,
                           endPoint: .trailing)
            .frame(height: 30)
            .cornerRadius(thumbCornerRadius)
            Text("\(Int(100 * percent))%")
                .bold().font(.title2).offset(x: scoreWidth * percent)
        }
    }
}

struct SolutionView_Previews: PreviewProvider {
    static var previews: some View {
        SolutionView(quizVM: QuizVM(quiz: generateQuiz()), displayed: .constant(true))
    }
}
