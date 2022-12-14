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
                 , title: "Le myst??re de la vie sur Terre enfin r??solu ? ?? C???est une d??couverte incroyable?????"
                 , date: 20221021
                 , auteur: "Futura"
                 , image: "https://cdn.futura-sciences.com/cdn-cgi/image/width=1920,quality=50,format=auto/sources/images/apparition-vie-goutte-eau.jpg"
                 , description: "Depuis toujours, les scientifiques cherchent ?? ??lucider le myst??re de la vie. Au fil des d??cennies, ils ont ??labor?? des sc??narios. Et des chercheurs pensent aujourd???hui avoir trouv?? la r??ponse ?? l???une des questions cl??s qui restaient toujours en suspens. Comment des mol??cules primordiales ont-elles pu former spontan??ment des ??l??ments constitutifs de la vie ? Comment la vie a-t-elle ??merg?? sur notre Terre??? Les scientifiques - et pas qu'eux - se posent cette question existentielle depuis presque toujours. Au fil du temps et de leurs ??tudes, ils en sont venus ?? conclure que la vie ??tait apparue dans les oc??ans, sans pour autant r??ussir ?? expliquer les m??canismes chimiques qui avaient men?? des??mol??cules??primordiales aux ??l??ments constitutifs de la vie. Aujourd'hui, des??chimistes de l???universit?? Purdue??(??tats-Unis) l??vent le myst??re.Pour bien comprendre, il faut sans doute pr??ciser que les??acides amin??s??bruts, ces mol??cules primordiales qui ont pu ??tre amen??es sur Terre tr??s r??guli??rement par des??m??t??orites, peuvent r??agir pour former des??peptides??- les ??l??ments constitutifs des??prot??ines??et donc, de la vie. Mais ce processus n??cessite la perte d'une mol??cule d'eau. Difficile ?? imaginer dans un milieu aussi humide que les oc??ans dans lesquels les chercheurs envisagent - et des preuves confirment -??que la vie a ??merg?? sur notre Plan??te.Pour se d??velopper, la vie semble donc avoir besoin, ?? la fois d'un environnement avec de l'eau et d'un environnement... sans eau ! C'est ce dilemme que les chimistes de l'universit?? Purdue semblent avoir r??solu. L'essence de leur solution ????? L'eau n'est pas mouill??e partout. ????Comprenez que l?? o?? une??goutte d???eau??rencontre l'atmosph??re, il peut se produire des r??actions incroyablement rapides. Des r??actions qui lient les acides anim??s en peptides."
                   , theme:  "Sciences de la vie et de la Terre"
                   , level: 4
                   )
                   
            )
        
    }
}
