//
//  PostsItem_View.swift
//  Science4You
//
//  Created by Apprenant 62 on 27/10/2022.
//

import SwiftUI

struct PostsItem_View: View {
    
    let prmPost: Post
    
    var body: some View {
        ZStack{
           
           
                
                
            HStack{
                
                //Color(.blue)
                
                    
                    
                    Image(uiImage: prmPost.image.load())
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                    
                        .frame(width: 100, height: 100, alignment: .center)
                    
                        .clipped()
                    
                    
                        
                    
                    
                    
                    
                    VStack{
                        
                        
                        Text(dateFormatterUS(date: prmPost.date))
                            .fontWeight(.light)
                        
                        Divider()
                        
                        Text(prmPost.title)
                        
                    }
                    
                   
                    
                    
                    
                    Spacer()
                }
            .padding(10)
            
            
        }
        .padding(.all, 3.0)
        
        

            
    }
    
}

struct PostsItem_View_Previews: PreviewProvider {
    static var previews: some View {
        
//        let    p_Id: String = ""
//        let    type:      String = ""//Array<PostType> ?
//        let    title:     String = ""
//        let    date:      Int = 0//(YYYYMMDD)
//        let    auteur:    String = ""
//        let    image:     String  = ""// irl String ? Image ?
//        let    description:    String = ""
//        let    theme : String = ""
//        let    level:     Int = 0
        
        PostsItem_View(prmPost:
            Post(  id: 44
                 , type: "Articles"
                 , title: "Le mystère de la vie sur Terre enfin résolu ? « C’est une découverte incroyable »"
                 , date: 20221021
                 , auteur: "Futura"
                 , image: "https://cdn.futura-sciences.com/cdn-cgi/image/width=1920,quality=50,format=auto/sources/images/apparition-vie-goutte-eau.jpg"
                 , description: "Depuis toujours, les scientifiques cherchent à élucider le mystère de la vie. Au fil des décennies, ils ont élaboré des scénarios. Et des chercheurs pensent aujourd’hui avoir trouvé la réponse à l’une des questions clés qui restaient toujours en suspens. Comment des molécules primordiales ont-elles pu former spontanément des éléments constitutifs de la vie ? Comment la vie a-t-elle émergé sur notre Terre ? Les scientifiques - et pas qu'eux - se posent cette question existentielle depuis presque toujours. Au fil du temps et de leurs études, ils en sont venus à conclure que la vie était apparue dans les océans, sans pour autant réussir à expliquer les mécanismes chimiques qui avaient mené des molécules primordiales aux éléments constitutifs de la vie. Aujourd'hui, des chimistes de l’université Purdue (États-Unis) lèvent le mystère.Pour bien comprendre, il faut sans doute préciser que les acides aminés bruts, ces molécules primordiales qui ont pu être amenées sur Terre très régulièrement par des météorites, peuvent réagir pour former des peptides - les éléments constitutifs des protéines et donc, de la vie. Mais ce processus nécessite la perte d'une molécule d'eau. Difficile à imaginer dans un milieu aussi humide que les océans dans lesquels les chercheurs envisagent - et des preuves confirment - que la vie a émergé sur notre Planète.Pour se développer, la vie semble donc avoir besoin, à la fois d'un environnement avec de l'eau et d'un environnement... sans eau ! C'est ce dilemme que les chimistes de l'université Purdue semblent avoir résolu. L'essence de leur solution ? « L'eau n'est pas mouillée partout. » Comprenez que là où une goutte d’eau rencontre l'atmosphère, il peut se produire des réactions incroyablement rapides. Des réactions qui lient les acides animés en peptides."
                   , theme:  "Sciences de la vie et de la Terre"
                   , level: 4
                   )
                   
            )
        
    }
}
