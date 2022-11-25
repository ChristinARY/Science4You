//
//  ExperiencesItemView.swift
//  Science4You
//
//  Created by Audrey Mo on 31/10/2022.
//

import SwiftUI

struct ExperiencesItemView: View {
    let prmExp: Experiences
    var body: some View {
        VStack{
            Text(prmExp.title)
                .foregroundColor(.white)
                .font(.system(size: 21))
                .padding()
                .background(.black)
                .cornerRadius(20)
                .offset(x: 0, y: 2)
            
                
            Image(uiImage: prmExp.image.load())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .frame(width: 170, height: 170, alignment: .center)
            
            Text(prmExp.description)
            
            Spacer()
            
        }
    }
}

struct ExperiencesItemView_Previews: PreviewProvider {
    static var previews: some View {
        ExperiencesItemView(prmExp: Experiences(title: "L'Eruption du Volcan", image: "https://jouets247.fr/wp-content/uploads/2021/04/experiences-enfant8s.jpg", description: "pour faire un volcan il vous faudra: beaucoup de patience", level: 5, fieldId: 1))
    }
}
