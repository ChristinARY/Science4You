//
//  QuizVM.swift
//  Science4You
//
//  Created by apprenant83 on 22/10/2022.
//

import Foundation

/*  Définition du statut:
    1 = choisir la réponse pour la question posée
    2 = valider le choix pour la réponse
    3 = délai avant affichage de la correction
    4 = passer à la question suivante
    5 = le quiz est fini
*/

class QuizVM: ObservableObject {
    var quiz: Quiz
    var currentQuestionIndex: Int = 0
    var numAnsweredQuestions: Int = 0
    var numGoodAnswers: Int = 0
    @Published var status: Int = 1

    init(quiz: Quiz) {
        self.quiz = quiz
        resetQuiz()
    }

    func numAnswers(questionIndex: Int) -> Int {
        return quiz.questionsArray[questionIndex].answersArray.count
    }

    func currentNumAnswers() -> Int {
        return numAnswers(questionIndex: currentQuestionIndex)
    }

    func getCurrentContent() -> String {
        return quiz.questionsArray[currentQuestionIndex].content
    }

    func getCurrentProposition(answerIndex: Int) -> String {
        return quiz.questionsArray[currentQuestionIndex].answersArray[answerIndex].proposition
    }

    func hasCurrentUniqueAnswer() -> Bool {
        return quiz.questionsArray[currentQuestionIndex].hasUniqueAnswer()
    }

    func selectCurrentAnswer(answerIndex: Int) {    // pour la question affichée (current)
        if status < 3 {
            if hasCurrentUniqueAnswer() {           // fonctionnement comme un radio group
                for index in 0..<currentNumAnswers() {
                    quiz.questionsArray[currentQuestionIndex].answersArray[index].wasSelected = (index == answerIndex)
                }
            } else {
                quiz.questionsArray[currentQuestionIndex].answersArray[answerIndex].wasSelected.toggle()
            }
            status = 2  // la réponse peut maintenant être validée
        }
    }

    func wasCurrentAnswerSelected(answerIndex: Int) -> Bool {
        return quiz.questionsArray[currentQuestionIndex].answersArray[answerIndex].wasSelected
    }

    func isCurrentAnswerTrue(answerIndex: Int) -> Bool {
        return quiz.questionsArray[currentQuestionIndex].answersArray[answerIndex].isTrue
    }

    func validateAnswer() {
        if status == 2 {
            if quiz.questionsArray[currentQuestionIndex].wasGoodAnswered() {
                numGoodAnswers += 1
            }
            numAnsweredQuestions += 1
        //  si animation status = 3, sinon:
            Thread.sleep(forTimeInterval: 0.4)  // petite temporisation
            if currentQuestionIndex < quiz.questionsArray.count - 1 {
                status = 4  // en attente de la question suivante
            } else {
                status = 5  // c'était la dernière question
            }
        }
    }

    func showNextQuestion() {
        if status == 4 {
            currentQuestionIndex += 1
            status = 1
        }
    }

    func resetQuiz() {
        for q in 0..<quiz.questionsArray.count {
            for a in 0..<numAnswers(questionIndex: q) {
                quiz.questionsArray[q].answersArray[a].wasSelected = false
            }
            quiz.questionsArray[q].shuffleAnswers()     // pour que les réponses n'apparaissent pas dans le même ordre à chaque fois
        }
        currentQuestionIndex = 0
        numAnsweredQuestions = 0
        numGoodAnswers = 0
        status = 1
    }
}
