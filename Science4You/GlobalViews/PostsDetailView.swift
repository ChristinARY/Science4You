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
            , title: "La pr??sence de ce gaz sur une exoplan??te serait un bon indicateur de la pr??sence r??cente d???une vie extraterrestre"
            , date: 20210101
            , auteur: "Futura"
            , image: "https://cdn.futura-sciences.com/cdn-cgi/image/width=1920,quality=60,format=auto/sources/images/chandrawebb_ngc3324_comp.jpg"
            , description: "La d??tection d'un gaz, ??mis naturellement par les plantes, serait le signe le plus ??vident de la vie sur une autre plan??te, selon l'universit?? de Californie : il suffirait donc de d??tecter ce gaz dans d'autres mondes pour prouver l'existence d'une vie extraterrestre.Le bromom??thane, ou bromure de m??thyle, est issu d'un m??canisme de d??fense de certaines plantes terrestres et aquatiques : le processus de m??thylation est l'action par laquelle les plantes expulsent des contaminants ??trangers, comme le bromure, en y attachant une s??rie d'atomes de carbone et d'hydrog??ne, lui permettant de s'??chapper sous la forme de gaz.Ce gaz est produit par les plantes de la famille brassica, parmi lesquelles les brocolis, mais aussi certaines algues et le phytoplancton. Dans de tr??s rares cas, ce gaz peut ??tre issu d'un processus g??ologique, comme une ??ruption volcanique.La d??couverte de ce gaz n'est pas r??cente et a d??j?? eu de nombreuses applications scientifiques : celui-ci a ??t?? utilis?? comme pesticide jusqu'au d??but des ann??es 2000, avant d'??tre interdit dans de nombreux pays par le protocole de Montr??al en raison de ses cons??quences sur la sant?? humaine. Il reste utilis?? aux ??tats-Unis, notamment pour le d??sherbage des terrains de golf lors de comp??titions ou pour le gazon de nombreux ??quipements sportifs. C'est un puissant gaz ?? effet de serre qui participe ?? la destruction de la couche d'ozone. La France a interdit son usage depuis 2005, avec des d??rogations pour certains usages. L'une des caract??ristiques de ce gaz est qu'il est tr??s ??ph??m??re, un point int??ressant dans la recherche d'autres vies dans l'Univers : selon l'Universit?? de Californie, ?? Riverside, s'il ??tait d??tect?? sur une exoplan??te, cela signifierait donc que l'organisme vivant qui l'a g??n??r?? est toujours en vie, puisque une fois ??mis, il dispara??t rapidement. Cette caract??ristique est primordiale car de nombreux autres gaz ou ??l??ments solides t??moignent parfois d'un ??v??nement g??ologique qui s'est d??roul?? il y a tr??s longtemps.Il partage ??galement sa longueur d'onde avec un gaz ?? cousin ??, le chlorure de m??thyle, et cette signature combin??e rend ces deux gaz tr??s faciles ?? d??tecter, m??me de tr??s loin. Ces deux gaz bien distincts sont r??v??lateurs de la pr??sence d'un organisme biologique. Il faut tout de m??me pr??ciser que le chlorure de m??thyle a d??j?? ??t?? observ?? autour de certaines ??toiles mais, dans ces cas pr??cis, cela a probablement ??t?? caus?? par un autre processus que celui de la vie.Le bromom??thane serait par contre tr??s difficile ?? d??tecter sur Terre par une technologie qui se trouverait en dehors de notre Plan??te, m??me en cas de forte concentration. Les rayons UV du Soleil provoquent en effet l'??clatement des mol??cules d'eau dans l'atmosph??re, et celles-ci ??liminent en moins d'un an ce gaz dans notre atmosph??re terrestre. Mais ce probl??me, qui ne facilite pas sa d??tection dans ce cas, n'existe que pour les mondes comme le n??tre qui se trouvent ?? proximit?? du Soleil, ou d'une ??toile semblable.Les probl??mes li??s au rayonnement UV sont bien moins pr??sents autour des nombreuses ??toiles naines de la galaxie. Celles-ci ??mettent moins de rayons UV et la vie pourrait donc ??tre plus facilement d??tectable. L'Universit?? de Californie pr??cise que ces ??toiles naines doivent ??tre ??tudi??es en priorit?? pour y rechercher la pr??sence de vie car ?? la possibilit?? de trouver du bromom??thane dans leur atmosph??re est bien r??elle ??. Cependant, personne n'est encore ??quip?? pour faire une telle d??couverte, puisque m??me le t??lescope James-Webb n'a pas la capacit?? de d??tecter des traces d'??l??ments dans l'atmosph??re d'exoplan??tes. Mais il est d??j?? pr??vu que de nouveaux t??lescopes s'att??lent ?? cette t??che dans les prochaines ann??es, avec la recherche de biosignatures telles que la pr??sence de ce ?? gaz de la vie ?? sur d'autres plan??tes."
            , theme : "Astronomie"
            ,level: 5))
        //PostsDetailView(articleDetailed: Post(type: "Articles"))
//        PostsDetailView(articleDetailed: Post(title: "Ceci est un titre de Post"))
//        PostsDetailView(articleDetailed: Post())
    }
}
