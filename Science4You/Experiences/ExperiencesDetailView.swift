//
//  ExperiencesListView.swift
//  Science4You
//
//  Created by Apprenant 62 on 21/10/2022.
//

import SwiftUI

struct ExperiencesDetailView: View {
    var body: some View {
        ScrollView{
            VStack{
                Text("Faire sa lampe à lave étape par étape")
                    .font(.title2)
                    .bold()
                    .padding()
//                    .foregroundColor(.white)
//                    .font(.system(size: 25))
//                    .padding()
//                    .background(.black)
//                    .cornerRadius(20)
                
                Image("lampeALave")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 300, height: 190, alignment: .center)
                
                
                
                ScrollView{
                   
                        HStack {
                            VStack{
                                Text("Detail de l'expérience")
                                    .font(.title2)
                                    .bold()
                                    
//                                    .foregroundColor(.white)
//                                    .font(.system(size: 25))
//                                    .padding()
//                                    .background(.black)
//                                    .cornerRadius(20)
                                
                                Text("Les bulles de toutes les couleurs impressionneront à coup sûr les enfants !")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14))
                                    .padding()
                                
                              
                                
                                VStack(alignment: .leading){
                                    Text("Ce dont vous avez besoin :")
                                        .font(.system(size: 14))
                                    Text("De l’huile (ici on a utilisé de l’huile de colza)")
                                        .font(.system(size: 14))
                                    Text("Du vinaigre blanc")
                                        .foregroundColor(.black)
                                        .font(.system(size: 14))
                                    Text("Du bicarbonate de soude")
                                        .font(.system(size: 14))
                                    Text("Du colorant alimentaire")
                                        .font(.system(size: 14))
                                    Text("Un grand verre ou bocal")
                                        .font(.system(size: 14))
                                    Text("Un petit verre")
                                        .font(.system(size: 14))
                                }
                                .padding()
                                NavigationLink(destination: ExperiencesEtapes(), label:{
                                    Text("Commencer l'expérience")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: 300, height: 50)
                                        .background(.black)
                                        .cornerRadius(20)
//                                        .font(.title)
//                                        .bold()
//                                        .foregroundColor(.black)
//                                        .padding()
//                                        .foregroundColor(.white)
//                                        .font(.system(size: 25))
//                                        .padding()
//                                        .background(.black)
//                                    .cornerRadius(20)
                                        })
                                
                            }
                            
                            
                            
                        }
                        
                    }
                }
                   
                    
                }
            }
    
    
}

struct ExperiencesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExperiencesDetailView()
    }
}
