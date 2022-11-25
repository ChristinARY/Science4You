//
//  Post.swift
//  Science4You
//
//  Created by Apprenant 62 on 24/10/2022.
//

import Foundation

struct  Post: Identifiable, Hashable{
    let    uuid    = UUID()
    let    id: Int
    let    type:      String //Array<PostType> ?
    let    title:     String
    let    date:      Int //(YYYYMMDD)
    let    auteur:    String
    let    image:     String  // irl String ? Image ?
    let    description:    String
    let    theme : String
    let    level:     Int 
    
//    let    type:      String  = "type"//Array<PostType> ?
//    let    title:     String = "title"
//    let    date:      Int = 111//(YYYYMMDD)
//    let    auteur:    String = "auteur"
//    let    image:     String = "image"// irl String ? Image ?
//    let    description:    String = "description"
//    let    level:     Int = 999
}
