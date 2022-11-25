//
//  QuizView.swift
//  Science4You
//
//  Created by apprenant83 on 20/10/2022.
//

import SwiftUI

let radius: CGFloat = scrollCornerRadius
let titleHeight: CGFloat = 40
let answersHeight: CGFloat = 260    // total pour l'ensemble des réponses
let answerWidth: CGFloat = 300
let questionHeight: CGFloat = 80
let questionWidth: CGFloat = 300
let buttonWidth: CGFloat = 270
let sidePadding: CGFloat = 14

let backgroundColor = Color(.white)
let questionColor = Color("gray1")
let answerColor = Color("gray3")
let selectedColor = Color("gray2")
let trueColor = Color("true")
let falseColor = Color("false")
let labelColor = Color(.black)
let meterColor1 = Color("gray1")
let meterColor2 = Color("gray2")
let buttonColor = Color(.black)

struct QuizView: View {
    @ObservedObject var quizVM: QuizVM
    @State var displaySolution = false

    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: quizVM.quiz.title, image: quizVM.quiz.image)
            VStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .foregroundColor(questionColor)
                        .frame(height: questionHeight)
                    HStack(spacing: 0) {
                        Image(systemName: "\(quizVM.currentQuestionIndex + 1).circle")
                            .font(.title)
                            .padding(10)
                        Text(quizVM.getCurrentContent())
                            .font(.system(size: 16))
                            .bold()
                            .frame(width: questionWidth, height: questionHeight, alignment: .leading)
                    }
                }
                VStack(spacing: -thumbPadding) {
                    ForEach(0..<quizVM.currentNumAnswers(), id: \.self) { index in
                        AnswerView(quizVM: quizVM, index: index)
                    }
                }
            }.background(questionColor)
            .cornerRadius(radius)
            Spacer()
            HStack {
                QuizMeter(quizVM: quizVM)
                Spacer(minLength: 20)
                Button(getButtonLabel(), action: { clickButton() })
                    .frame(width: buttonWidth, height: 40)
                    .font(.system(size: 16).bold())
                    .background(buttonColor)
                    .foregroundColor(.white)
                .cornerRadius(radius)
            }.padding(sidePadding)
        }.padding(sidePadding)
            .fullScreenCover(isPresented: $displaySolution, content: {
                SolutionView(quizVM: quizVM, displayed: $displaySolution) })
    }

    func getButtonLabel() -> String {
        switch quizVM.status {
        case 1:
            if quizVM.hasCurrentUniqueAnswer() {
                return " Sélectionner une réponse    "
            } else {
                return "Sélectionner plusieurs réponses"
            }
        case 2:
            return "  Valider           "
        case 3:
            return "???"
        case 4:
            return "Question suivante      "
        case 5:
            return "   Récapitulatif       "
        default:
            return ""
        }
    }

    func clickButton() {
        switch quizVM.status {
        case 2:
            quizVM.validateAnswer()
            break
        case 4:
            quizVM.showNextQuestion()
            break
        case 5:
            displaySolution = true
        //  quizVM.resetQuiz()
            break
        default:
            break
        }
    }
}

struct TitleView: View {
    let title: String

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Rectangle()
                    .frame(height: radius)
                    .foregroundColor(backgroundColor)
                Rectangle()
                    .frame(height: titleHeight - radius)
            }
            Rectangle()
                .frame(height: titleHeight)
                .cornerRadius(radius)
            Text(title)
                .font(.system(size: 16))
                .bold()
                .foregroundColor(.white)
                .frame(height: titleHeight)
        }
    }
}

struct HeaderView: View {
    let title: String
    let image: String

    var body: some View {
        VStack(spacing: 0) {
        //  Spacer(minLength: 10)
            Text(title)
                .font(.title2)
                .bold()
                .frame(height: 56)
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: scrollCornerRadius))
                .frame(height: 220)
                .padding()
        }
    }
}
/*
struct HeaderView: View {
    let title: String
    let image: String

    var body: some View {
        VStack(spacing: 0) {
            TitleView(title: title)
            ZStack {
                Rectangle()
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 360, height: 160)
            }.mask(LinearGradient(gradient: Gradient(colors: [.black.opacity(1), .black.opacity(0.9), .black.opacity(0.5), .clear]), startPoint: .top, endPoint: .bottom))
        }
    }
}
*/
struct AnswerView: View {
    @ObservedObject var quizVM: QuizVM
    var index: Int
    var wasSelected: Bool {
        return quizVM.wasCurrentAnswerSelected(answerIndex: index)
    }
    var height: CGFloat {
        return answersHeight / Double(quizVM.currentNumAnswers())
    }

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(getColor())
                .frame(height: height)
            HStack(spacing: 0) {
                Image(systemName: getLabel())
                    .font(.system(size: wasSelected ? 26 : 24))
                    .foregroundColor(wasSelected ? labelColor : .black)
                    .padding(10)
                Text(quizVM.getCurrentProposition(answerIndex: index))
                    .font(.system(size: 14))
                    .frame(width: answerWidth, height: height, alignment: .leading)
            }
        }.cornerRadius(thumbCornerRadius)
            .padding(thumbPadding)
            .onTapGesture {
            quizVM.selectCurrentAnswer(answerIndex: index)
        }
    }

    func getColor() -> Color {
        if quizVM.status > 2 {
            return quizVM.isCurrentAnswerTrue(answerIndex: index) ? trueColor : wasSelected ? falseColor : answerColor
        } else {
            return wasSelected ? selectedColor : answerColor
        }
    }

    func getLabel() -> String {
        switch index {
        case 0:
            return wasSelected ? "a.circle.fill" : "a.circle"
        case 1:
            return wasSelected ? "b.circle.fill" : "b.circle"
        case 2:
            return wasSelected ? "c.circle.fill" : "c.circle"
        case 3:
            return wasSelected ? "d.circle.fill" : "d.circle"
        case 4:
            return wasSelected ? "e.circle.fill" : "e.circle"
        case 5:
            return wasSelected ? "f.circle.fill" : "f.circle"
        case 6:
            return wasSelected ? "g.circle.fill" : "g.circle"
        case 7:
            return wasSelected ? "h.circle.fill" : "h.circle"
        default:
            return ""
        }
    }
}

struct QuizMeter: View {
    @ObservedObject var quizVM: QuizVM
    
    let size: CGFloat = 60
    let width: CGFloat = 18
    let separator = 0.006
    
    var body: some View {
        let numQuestions = quizVM.quiz.numQuestions()
        let numAnswered = quizVM.numAnsweredQuestions
        let arcPercent = 1.0 / Double(numQuestions)
        
        ZStack {
            Circle()
                .stroke(meterColor1, lineWidth: width)
            if numAnswered > 0 { Text("\(quizVM.numGoodAnswers) / \(numAnswered)")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
            }
            ForEach(0 ..< numQuestions, id: \.self) { index in
                Circle()
                    .rotation(.degrees(90 + 360 * arcPercent * Double(index)))
                    .trim(from: 0, to: arcPercent - separator) .stroke(index + 1 > numAnswered ? meterColor2 : quizVM.quiz.questionsArray[index].wasGoodAnswered() ? .green : .red, lineWidth: width-2)
            }
        }.frame(width: size, height: size)
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(quizVM: QuizVM(quiz: generateQuiz()))
    }
}

func generateQuiz() -> Quiz {   /// provisoirement, pour tester
    return svtQuiz
}
