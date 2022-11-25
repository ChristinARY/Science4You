//
//  ExperiencesEtapes.swift
//  Science4You
//
//  Created by Apprenant 101 on 27/10/2022.
//

import SwiftUI

struct ExperiencesEtapes: View {
    var body: some View {
        
        VStack{
            Text("Étape 1 : Versez le bicarbonate puis l'huile")
                .font(.title2)
                .bold()
                .padding()
//                .foregroundColor(.white)
//                .font(.system(size: 25))
//                .padding()
//                .background(.black)
//                .cornerRadius(20)
            
            Image("etape1")
                .resizable()
                .cornerRadius(20)
                .frame(width: 280, height: 280, alignment: .center)
            
            
            
            
        
                ScrollView{
                    HStack {
                        VStack{
                            
                            
                            Text("Placez 2 cuillères à soupe de bicarbonate au fond du grand récipient transparent.Versez doucement l'huile par-dessus, pour remplir jusqu'au 2/3 du verre dans trop faire remuer la poudre du dessous.")
                                .foregroundColor(.black)
                                .font(.system(size: 16))
                                .padding()
                            
                            Spacer()
                            
                            NavigationLink(destination: ExperiencesEtapes2(), label: {
                                
                                Text("Prochaine étape")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 300, height: 50)
                                    .background(.black)
                                    .cornerRadius(20)
                                
                            })
                            
                            
                        }
                        
                        
                        
                    }
                    Spacer()
                }
                
            }
                
            }
        }

    


struct ExperiencesEtapes_Previews: PreviewProvider {
    static var previews: some View {
        ExperiencesEtapes()
    }
}
