//
//  ExperiencesEnd.swift
//  Science4You
//
//  Created by Apprenant 101 on 27/10/2022.
//

import SwiftUI

struct ExperiencesEnd: View {
    var body: some View {
       
        VStack{
            Text("Faire sa lampe à lave étape par étape")
                .font(.title2)
                .bold()
                .padding()
//                .foregroundColor(.white)
//                .font(.system(size: 25))
//                .padding()
//                .background(.black)
//                .cornerRadius(20)
            
            Image("felicitation")
            
                .resizable()
                .frame(width: 250, height: 200, alignment: .center)
                .padding()

            
            
            
            ScrollView{
                ScrollView{
                    HStack {
                        VStack{
                            
                            
                            Text("Félicitation !")
                                .foregroundColor(.black)
                                .font(.title)
                                .padding()
                            Text("Vous avez terminer l'expérience")
                                .foregroundColor(.black)
                                .font(.title2)
                                .padding()
                            
                            
                            NavigationLink(destination: ExperiencesListView(), label:{
                            Text("Autres expériences")
                                   .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 300, height: 50)
                                    .background(.black)
                                    .cornerRadius(20)})
//                            NavigationLink(destination: ExperiencesListView(), label:{
//                                Text("Ajouter au favoris")
//                                    .font(.title2)
//                                    .bold()
//                                    .foregroundColor(.white)
//                                    .padding()
//                                    .frame(width: 300, height: 50)
//                                    .background(.black)
//                                    .cornerRadius(20)})
//                                .foregroundColor(.white)
//                                .font(.system(size: 25))
//                                .padding()
//                                .background(.black)
//                                .cornerRadius(20)})
                            
                        }
                        
                        
                        
                    }
                    Spacer()
                }
                
                
            }
            }
        }
    
}

struct ExperiencesEnd_Previews: PreviewProvider {
    static var previews: some View {
        ExperiencesEnd()
    }
}
