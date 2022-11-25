//
//  ExperiencesLastEtapes.swift
//  Science4You
//
//  Created by Apprenant 101 on 27/10/2022.
//

import SwiftUI

struct ExperiencesLastEtapes: View {
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
            
            Image("etapefinale")
                .resizable()
                .cornerRadius(20)
                .frame(width: 280, height: 280, alignment: .center)
            
            
            
            
            ScrollView{
                ScrollView{
                    HStack {
                        VStack{
                            
                            
                            Text("Pour réactiver le tout, il suffit de reverser du vinaigre !Pour un effet Wouahou , placez le verre sous une lumière !Notez que cette expérience NE PEUT ÊTRE RÉALISÉE DANS UN CONTENANT FERMÉ, car le gaz a besoin de s'échapper.Vous pouvez poser un couvercle, mais il faudra faire quelques petits trous sur le dessus.")
                                .foregroundColor(.black)
                                .font(.system(size: 16))
                                .padding()
                            
                            NavigationLink(destination:ExperiencesEnd(), label:{
                            
                            Text("Terminer")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 300, height: 50)
                                    .background(.black)
                                    .cornerRadius(20)
//
                            })
                            
                        }
                        
                        
                        
                    }
                    Spacer()
                }
                
            }
                
            }
        }

    
}

struct ExperiencesLastEtapes_Previews: PreviewProvider {
    static var previews: some View {
        ExperiencesLastEtapes()
    }
}
