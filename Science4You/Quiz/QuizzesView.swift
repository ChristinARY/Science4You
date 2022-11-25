//
//  QuizzesView.swift
//  Science4You
//
//  Created by apprenant83 on 27/10/2022.
//

import SwiftUI
/*
let titleOffset: CGFloat = 10
let textHeight: CGFloat = 68
let thumbPadding: CGFloat = 5
let thumbWidth: CGFloat = 175
let thumbHeight: CGFloat = 100
let thumbCornerRadius: CGFloat = 10
let numEmptyThumbs = 2
let emptyColor = Color(.white).opacity(0.7)
let scrollColor = Color(.gray).opacity(0.15)
let scrollCornerRadius: CGFloat = thumbCornerRadius + thumbPadding
*/
// Ce qui suit est une SIMULATION en attendant plus de données

struct QuizzesView: View {
    @EnvironmentObject var prefs: Preferences

    var body: some View {
        NavigationView{
            VStack {
                Text("Quizzes")
                    .font(.title)
                    .bold()
                ScrollView() {
                    VStack(spacing: 20) {
                        ThemeView(title: prefs.label("svt"))    /// temporairement
                        ThemeView(title: prefs.label("math"))   /// temporairement
                        ThemeView(title: prefs.label("med"))    /// temporairement
                        ForEach(0..<prefs.themes.count, id: \.self) { index in
                            if prefs.themes[index].isSelected {
                                ThemeView(title: prefs.themes[index].label)
                            }
                        }
                    }
                }.cornerRadius(scrollCornerRadius)
                    .padding(sidePadding)
            }
        }
    }
}
/*
struct ThemeView: View {
    var title: String

    var body: some View {
        VStack {
            TitleView(title: title)
            ScrollView(.horizontal) {
                HStack {
                    if title == "svt" {
                        ItemView(item: Item(withQuiz: svtQuiz))
                            .onTapGesture { QuizView(quizVM: QuizVM(quiz: svtQuiz)) }   /// vérifier le mécanisme (but recherché: ouvrir la page depuis l'item, si possible avec une animation)
                    }
                    if title == "math" {
                        ItemView(item: Item(withQuiz: at1Quiz))
                        ItemView(item: Item(withQuiz: at2Quiz))
                        ItemView(item: Item(withQuiz: at3Quiz))
                    }
                //  ForEach(0..<Int.random(in: 1...8), id: \.self) { index in
                    ForEach(0...8, id: \.self) { index in
                        ItemView(item: Item(withQuiz: Quiz()))     /// temporaire (pour la simulation)
                    }
                }
            }
        }
    }
}
*/
struct ThemeView: View {
    var title: String
    @EnvironmentObject var prefs: Preferences

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.title2)
                .bold()
                .offset(x: titleOffset, y: 0)
            ZStack(alignment: .top) {
                Rectangle()
                    .foregroundColor(scrollColor)
                ScrollView(.horizontal) {
                    ZStack(alignment: .topLeading) {
                        HStack(spacing: -thumbPadding) {
                            ForEach(1...numEmptyThumbs, id: \.self) { _ in
                                VStack {
                                    RoundedRectangle(cornerRadius: thumbCornerRadius)
                                        .foregroundColor(emptyColor)
                                        .frame(width: thumbWidth, height: thumbHeight)
                                        .padding(thumbPadding)
                                    Text("")
                                        .frame(width: thumbWidth, height: textHeight)
                                }
                            }
                        }
                        HStack(spacing: -thumbPadding) {
                        //  Remplissage avec les items récupérés:
                            if title == prefs.label("svt") {    /// temporairement
                                NavigationLink(destination: QuizView(quizVM: QuizVM(quiz: svtQuiz))) {
                                    ItemView(item: Item(withQuiz: svtQuiz))
                                        .padding(thumbPadding)
                                }
                            }
                            if title == prefs.label("math") {    /// temporairement
                                NavigationLink(destination: QuizView(quizVM: QuizVM(quiz: at1Quiz))) {
                                    ItemView(item: Item(withQuiz: at1Quiz))
                                        .padding(thumbPadding)
                                }
                                NavigationLink(destination: QuizView(quizVM: QuizVM(quiz: at2Quiz))) {
                                    ItemView(item: Item(withQuiz: at2Quiz))
                                        .padding(thumbPadding)
                                }
                                NavigationLink(destination: QuizView(quizVM: QuizVM(quiz: at3Quiz))) {
                                    ItemView(item: Item(withQuiz: at3Quiz))
                                        .padding(thumbPadding)
                                }
                            }
                            if title == prefs.label("med") {    /// temporairement
                                NavigationLink(destination: QuizView(quizVM: QuizVM(quiz: scvQuiz))) {
                                    ItemView(item: Item(withQuiz: scvQuiz))
                                        .padding(thumbPadding)
                                }
                            }
                            if prefs.simulated {
                                ForEach(0...4, id: \.self) { index in
                                    ItemView(item: Item(withQuiz: Quiz()))     /// temporaire (pour la simulation)
                                        .padding(thumbPadding)
                                }
                            }
                        }
                    }
                }
            }.cornerRadius(scrollCornerRadius)
        }
    }
}

struct ItemView: View {
    let item: Item
    @EnvironmentObject var prefs: Preferences
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ZStack {
                    Image(item.image != "" ? item.image : "no_image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                    ZStack {
                        Circle()
                            .frame(width: 18)
                            .foregroundColor(item.getScoreColor(prefs.simulated))
                        if item.level > 0 && !prefs.simulated {     // niveau affiché uniquement s'il est connu (et si une simulation de la version future n'est pas effectuée)
                            Text("\(item.level)")
                                .foregroundColor(item.getTextColor())
                                .font(.system(size: 12))
                                .bold()
                        }
                    }.offset(x: thumbWidth/2 - 12, y: thumbHeight/2 - 12)
                }.frame(width: thumbWidth, height: thumbHeight)
                    .cornerRadius(thumbCornerRadius)
                Text(item.title)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                    .font(.system(size: 14))
                    .frame(width: thumbWidth, height: textHeight)
                    .offset(x: 0, y: thumbPadding)
            }
        }
    }
}

struct QuizzesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            QuizzesView().environmentObject(Preferences())
            //  ThemeView(title: "Sciences de la Vie")
            //  ItemView(image: "")   // pas d'image
        }
    }
}
