//
//  ViewDetailPost.swift
//  Science4You
//
//  Created by Audrey Mo on 20/10/2022.
//

import SwiftUI

struct PostsDetailView: View {
    let articleDetailed : Post
    var body: some View {
       
            ScrollView{
            
             
                    VStack{
                        Image(uiImage: articleDetailed.image.load())
                            .resizable()
                            .scaledToFit()
                            .frame(width: 395)
                            
                        
                        ZStack{
                            Color(.black)
                            Text(articleDetailed.title)
                                .multilineTextAlignment(.leading).bold()
                                .font(.title2)
                                .padding()
                                .foregroundColor(.white)
                            
                        }
                        


                    VStack {
                        HStack{
                            Text(articleDetailed.auteur)
                            
                               
                            Spacer()

                        }
                        HStack{
                            Text(dateFormatterUS(date: articleDetailed.date))
                            Spacer()
                                
                        }
                        
                    }.padding()
                    
                    Divider()
                    
                    Text(articleDetailed.description)
                        .padding()
                    Spacer()
                    //Text(articleDetailed.Description)
                }
                
                    
            }
            
           
           // .ignoresSafeArea()
        

    }
        
}

struct PostsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostsDetailView(articleDetailed: Post(
            id: 22
            , type: "Articles"
            , title: "La présence de ce gaz sur une exoplanète serait un bon indicateur de la présence récente d’une vie extraterrestre"
            , date: 20210101
            , auteur: "Futura"
            , image: "https://cdn.futura-sciences.com/cdn-cgi/image/width=1920,quality=60,format=auto/sources/images/chandrawebb_ngc3324_comp.jpg"
            , description: "La détection d'un gaz, émis naturellement par les plantes, serait le signe le plus évident de la vie sur une autre planète, selon l'université de Californie : il suffirait donc de détecter ce gaz dans d'autres mondes pour prouver l'existence d'une vie extraterrestre.Le bromométhane, ou bromure de méthyle, est issu d'un mécanisme de défense de certaines plantes terrestres et aquatiques : le processus de méthylation est l'action par laquelle les plantes expulsent des contaminants étrangers, comme le bromure, en y attachant une série d'atomes de carbone et d'hydrogène, lui permettant de s'échapper sous la forme de gaz.Ce gaz est produit par les plantes de la famille brassica, parmi lesquelles les brocolis, mais aussi certaines algues et le phytoplancton. Dans de très rares cas, ce gaz peut être issu d'un processus géologique, comme une éruption volcanique.La découverte de ce gaz n'est pas récente et a déjà eu de nombreuses applications scientifiques : celui-ci a été utilisé comme pesticide jusqu'au début des années 2000, avant d'être interdit dans de nombreux pays par le protocole de Montréal en raison de ses conséquences sur la santé humaine. Il reste utilisé aux États-Unis, notamment pour le désherbage des terrains de golf lors de compétitions ou pour le gazon de nombreux équipements sportifs. C'est un puissant gaz à effet de serre qui participe à la destruction de la couche d'ozone. La France a interdit son usage depuis 2005, avec des dérogations pour certains usages. L'une des caractéristiques de ce gaz est qu'il est très éphémère, un point intéressant dans la recherche d'autres vies dans l'Univers : selon l'Université de Californie, à Riverside, s'il était détecté sur une exoplanète, cela signifierait donc que l'organisme vivant qui l'a généré est toujours en vie, puisque une fois émis, il disparaît rapidement. Cette caractéristique est primordiale car de nombreux autres gaz ou éléments solides témoignent parfois d'un événement géologique qui s'est déroulé il y a très longtemps.Il partage également sa longueur d'onde avec un gaz « cousin », le chlorure de méthyle, et cette signature combinée rend ces deux gaz très faciles à détecter, même de très loin. Ces deux gaz bien distincts sont révélateurs de la présence d'un organisme biologique. Il faut tout de même préciser que le chlorure de méthyle a déjà été observé autour de certaines étoiles mais, dans ces cas précis, cela a probablement été causé par un autre processus que celui de la vie.Le bromométhane serait par contre très difficile à détecter sur Terre par une technologie qui se trouverait en dehors de notre Planète, même en cas de forte concentration. Les rayons UV du Soleil provoquent en effet l'éclatement des molécules d'eau dans l'atmosphère, et celles-ci éliminent en moins d'un an ce gaz dans notre atmosphère terrestre. Mais ce problème, qui ne facilite pas sa détection dans ce cas, n'existe que pour les mondes comme le nôtre qui se trouvent à proximité du Soleil, ou d'une étoile semblable.Les problèmes liés au rayonnement UV sont bien moins présents autour des nombreuses étoiles naines de la galaxie. Celles-ci émettent moins de rayons UV et la vie pourrait donc être plus facilement détectable. L'Université de Californie précise que ces étoiles naines doivent être étudiées en priorité pour y rechercher la présence de vie car « la possibilité de trouver du bromométhane dans leur atmosphère est bien réelle ». Cependant, personne n'est encore équipé pour faire une telle découverte, puisque même le télescope James-Webb n'a pas la capacité de détecter des traces d'éléments dans l'atmosphère d'exoplanètes. Mais il est déjà prévu que de nouveaux télescopes s'attèlent à cette tâche dans les prochaines années, avec la recherche de biosignatures telles que la présence de ce « gaz de la vie » sur d'autres planètes."
            , theme : "Astronomie"
            ,level: 5))
        //PostsDetailView(articleDetailed: Post(type: "Articles"))
//        PostsDetailView(articleDetailed: Post(title: "Ceci est un titre de Post"))
//        PostsDetailView(articleDetailed: Post())
    }
}
