//
//  TemplateView.swift
//  Science4You
//
//  Created by apprenant83 on 03/11/2022.
//


import SwiftUI

struct TemplateView: View {
    var body: some View {
        VStack {
            Text("Lectures")
                .font(.title)
                .bold()
            ScrollView() {
                VStack(spacing: 20) {
                    HorizontalView(title: "Actualités")
                    HorizontalView(title: "Le saviez-vous ?")
                    HorizontalView(title: "Comment ça marche ?")
                }
            }.padding(sidePadding)
        }
    }
}

struct HorizontalView: View {
    var title: String
    
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
                            // remplir avec les Posts issus de l'API
                            // selon le modèle ci-dessous (remplacer le Post bidon par un vrai Post)
                            //                                PostView(item: Post(p_Id: 0, type: "Type", title: "Titre du post à renseigner (ici, c'est une simulation)", date: 0, auteur: "Auteur", image: "", description: "Description (ici, il n'y en a pas)", theme: "", level: 0)) // simulation !!!
                            //                                    .padding(thumbPadding)
                            // mettre à la suite autant de PostViews qu'il y a de Posts
                            // ne pas oublier .padding(thumbPadding) sur chaque PostView
                        }
                    }
                }
            }.clipShape(RoundedRectangle(cornerRadius: scrollCornerRadius))
        }
    }
}

struct PostView: View {
    let item: Post
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Image(item.image == "" ? "no_image" : item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width: thumbWidth, height: thumbHeight)
                    .clipShape(RoundedRectangle(cornerRadius: thumbCornerRadius))
                Text(item.title)
                    .font(.system(size: 14))
                    .frame(width: thumbWidth, height: textHeight)
                    .offset(x: 0, y: thumbPadding)
            }
        }
    }
}

struct TemplateView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateView()
    }
}
