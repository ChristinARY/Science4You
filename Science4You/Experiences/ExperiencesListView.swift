//
//  ExperiencesListView.swift
//  Science4You
//
//  Created by Apprenant 101 on 03/11/2022.
//

//
//  ExperiencesListView.swift
//  Science4You
//
//  Created by Apprenant 101 on 21/10/2022.
//

import SwiftUI

struct ExperiencesListView: View {
    var body: some View {
        
        VStack(spacing: 0){
            Spacer(minLength: 10)
            Text("Choisir une expérience")
                .font(.title)
                .bold()
            
            Image("expImg")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: scrollCornerRadius))
                .frame(height: 200)
                .padding()
            ZStack(alignment: .top) {
                Rectangle()
                    .foregroundColor(scrollColor)
                ScrollView {
                    VStack {
                        HStack(spacing: -thumbPadding) {
                            ThumbView(image: "lampeALave", title: "Réaliser une lampe à lave")
                                    .padding(thumbPadding)
                            ThumbView(image: "oeuf", title: "Transformer un oeuf en balle rebondissante")
                                    .padding(thumbPadding)
                        }
                        HStack(spacing: -thumbPadding) {
                            ThumbView(image: "geode", title: "Fabriquer une géode")
                                    .padding(thumbPadding)
                            ThumbView(image: "nuage", title: "Réaliser un nuage de mousse")
                                    .padding(thumbPadding)
                        }
                        HStack(spacing: -thumbPadding) {
                            ThumbView(image: "electricite", title: "Jouer avec l'électricité statique")
                                    .padding(thumbPadding)
                            ThumbView(image: "volcan", title: "Fabriquer un volcan")
                                    .padding(thumbPadding)
                        }
                    }
                }
            }.clipShape(RoundedRectangle(cornerRadius: scrollCornerRadius))
                .padding(sidePadding)
        }
    }
}

struct ThumbView: View {
    let image: String
    let title: String

    var body: some View {
        NavigationLink(destination: ExperiencesDetailView(), label:{
            VStack(spacing: -5) {
                Image(image == "" ? "no_image" : image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width: thumbWidth, height: thumbHeight)
                    .clipShape(RoundedRectangle(cornerRadius: thumbCornerRadius))
                Text(title)
                    .foregroundColor(.black)
                    .font(.system(size: 14))
                    .frame(width: thumbWidth, height: 40)
                    .offset(x: 0, y: thumbPadding)
                }
            })
        }
}

struct ExperiencesListView_Previews: PreviewProvider {
    static var previews: some View {
        ExperiencesListView()
    }
}














