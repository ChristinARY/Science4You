//
//  QuizStructs.swift
//  Science4You
//
//  Created by apprenant83 on 20/10/2022.
//

import Foundation
import SwiftUI

struct Answer {
    let proposition: String         // en cas d'échec: "[la proposition de réponse n'a pas pu être initialisée]"
    let isTrue: Bool                // en cas d'échec: false
    var wasSelected: Bool = false
}

struct Question {
    let content: String             // en cas d'échec: "[le libellé de la question n'a pas pu être initialisé]"
    var image: String = ""          // prévu dans le cas d'un quiz très illustré (avec une image différente à chaque question)
    var answersArray: [Answer] = []
    var explanation: String = ""    // en cas d'échec: "" (ce qui revient à pas d'explication affichée)

    mutating func shuffleAnswers() {
        answersArray.shuffle()
    }

    func hasUniqueAnswer() -> Bool {
        return numTrueAnswers() == 1
    }

    func numTrueAnswers() -> Int {
        var index = 0, numTrueAnswers = 0
        while index < answersArray.count {
            if answersArray[index].isTrue {
                numTrueAnswers += 1
            }
            index += 1
        }
        return numTrueAnswers
    }

    func wasGoodAnswered() -> Bool {
        var index = 0
        while index < answersArray.count {
            if answersArray[index].wasSelected != answersArray[index].isTrue {
                return false
            }
            index += 1
        }
        return true
    }

    func getSolution() -> String {
        var index = 0
        var trueAnswer = ""
        var nextline = false
        while index < answersArray.count {
            if answersArray[index].isTrue {
                if nextline {
                    trueAnswer += "\n"
                }
                trueAnswer += answersArray[index].proposition
                nextline = true
            }
            index += 1
        }
        return trueAnswer
    }
}

struct Quiz {
//  let id = UUID()
    var title: String
    var image: String
    var theme: String
    var level: Int
    var questionsArray: [Question] = []
    var lastScore: Double = -1  // valeur par défaut lorsque le quiz n'a jamais été fait

    init() {                            // initialisateur par défaut (destiné aux simulations)
        title = UUID().description      // pour afficher quelque chose de différent à chaque fois
        image = Int.random(in: 1...5) > 1 ? "default" : ""
        theme = "[thème à préciser]"
        level = Int.random(in: 1...5)
        lastScore = Double.random(in: -1...1)
    }

    init(title: String = "[libellé du quiz]", image: String = "", theme: String = "[thème à préciser]", level: Int = 1, questionsArray: [Question]) {
        self.title = title
        self.image = image
        self.theme = theme
        self.level = level
        self.questionsArray = questionsArray
    }

    init(title: String = "[libellé du quiz]", image: String = "", theme: String = "[thème à préciser]", level: Int = 1, withString: String) {  //  Analyse d'un texte contenant les questions, les réponses et les explications ou anecdotes éventuelles:
        let qTag = "***Q***", taTag = "***TA***", faTag = "***FA***", eTag = "***E***"

        var question: Question
        var questionContent = "", answerProposition = "", explanation = "", string = withString
        var isTrue = false, hasNextAnswer = false

        while !string.hasPrefix(qTag) && string.count > 0  {
            string.removeFirst(1)
        }
        while string.count > 0 {
            string.removeFirst(qTag.count)    // suppression du tag
            string = leadingClean(string)     // et des caractères inutiles
        //  Récupération de la question:
            questionContent = string
            while !string.hasPrefix(taTag) && !string.hasPrefix(faTag) && string.count > 0  {
                string.removeFirst(1)
            }
            questionContent.removeLast(string.count)
            questionContent = trailingClean(questionContent)
        //  Création de la question:
            question = Question(content: questionContent)
            hasNextAnswer = true
            while hasNextAnswer {
                isTrue = string.hasPrefix(taTag)
                if string.count > 0 {
                    string.removeFirst(taTag.count)   // suppression du tag
                    string = leadingClean(string)     // et des caractères inutiles
                //  Récupération de la réponse:
                    answerProposition = string
                    while !string.hasPrefix(taTag) && !string.hasPrefix(faTag) && !string.hasPrefix(eTag) && !string.hasPrefix(qTag) && string.count > 0  {
                        string.removeFirst(1)
                    }
                    answerProposition.removeLast(string.count)
                    answerProposition = trailingClean(answerProposition)
                //  Ajout de la réponse et de son booléen dans la structure de la question:
                    question.answersArray.append(Answer(proposition: answerProposition, isTrue: isTrue))
                    if !string.hasPrefix(eTag) && !string.hasPrefix(qTag) && string.count > 0 {
                        hasNextAnswer = true
                    } else {
                        hasNextAnswer = false
                        if string.hasPrefix(eTag) {
                            string.removeFirst(eTag.count)    // suppression du tag
                            string = leadingClean(string)     // et des caractères inutiles
                        //  Récupération de l'explication:
                            explanation = string
                            while !string.hasPrefix(qTag) && string.count > 0  {
                                string.removeFirst(1)
                            }
                            explanation.removeLast(string.count)
                            explanation = trailingClean(explanation)
                        //  Ajout de l'explication dans la structure de la question:
                            question.explanation = explanation
                        }
                    }
                }
            }
        //  Ajout de la question dans la structure du quiz:
            questionsArray.append(question)
        }
        self.title = title
        self.image = image
        self.theme = theme
        self.level = level
    }

    func numQuestions() -> Int { return questionsArray.count }
}

//  Comparer .removeFirst(numChars), .dropFirst(numChars) et .popFirst()
    func leadingClean(_ text: String) -> String {
        var cleaned = text
        while cleaned.first == " " || cleaned.first == "\n" || cleaned.last == "\r" {
            cleaned.removeFirst(1)
        }
        return cleaned
    }

//  Comparer .removeLast(numChars), .dropLast(numChars) et .popLast()
    func trailingClean(_ text: String) -> String {
        var cleaned = text
        while cleaned.last == " " || cleaned.last == "\n" || cleaned.last == "\r" {
            cleaned.removeLast(1)
        }
        return cleaned
    }

/*  func removeSuffix(_ suffix: String, from: String) -> String {
        var removed = from
        for _ in 0..<suffix.count {
            removed.popLast()
        }
        return removed
    }
*/
/*
struct Author {
    let name: String
//  autres propriétés à ajouter
}

struct Part {
    let subtitle: String
    let content: String
    let image: String
}

struct Post: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    var article: [Part] = []
    let author: Author
    let date: Date
    let theme: Theme
    let level: Int
}

struct Theme: Identifiable {
    let id = UUID()
    let name: String
    var image: String = ""  ///
    var postsArray: [Post] = []
}
*/
struct Item: Identifiable {
    let id = UUID()
    var title: String = ""
    var image: String = ""
    var theme: String = ""
    var level: Int = 0
    var score: Double = -1   // -1 signifie que le quiz n'a jamais été fait; sinon score est compris entre 0 [0 %] et 1 [100 %]
    var quiz: Quiz = Quiz()
    @State var isLoaded: Bool = false

    init(withQuiz: Quiz) {
        loadQuiz()
        quiz = withQuiz     /// redondance avec les autres éléments de l'item (voir comment mieux écrire le code: propriétés calculées ?)
        title = withQuiz.title
        image = withQuiz.image
        theme = withQuiz.theme
        level = withQuiz.level
        score = withQuiz.lastScore
    }

    func loadQuiz() {   /// simulation (voir plus tard pour le chargement asynchrone)
    //  Thread.sleep(forTimeInterval: 0.01)
        isLoaded = true
    }

    func getTextColor() -> Color {
        return score > 0.0 ? Color(.white) : Color(.white)  // à modifier si besoin de contraster plus avec getScoreColor()
    }

    func getScoreColor(_ simulated: Bool = false) -> Color {
        switch score {
        case 0.00 ... 0.15 :
            return Color("1")
        case 0.15 ... 0.30 :
            return Color("2")
        case 0.30 ... 0.45 :
            return Color("3")
        case 0.45 ... 0.55 :
            return Color("4")
        case 0.55 ... 0.70 :
            return Color("5")
        case 0.70 ... 0.85 :
            return Color("6")
        case 0.85 ... 1.0 :
            return Color("7")
        default :
            return level > 0 && !simulated ? Color(.black) : Color(.black).opacity(0)
        //  pas de pastille noire si le niveau n'est pas connu
        //  ou bien si l'on simule la version ultérieure dans laquelle la sélection par niveau sera effective
        }
    }
}
