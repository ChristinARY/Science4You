//
//  Field.swift
//  Science4You
//
//  Created by Apprenant 62 on 24/10/2022.
//

import Foundation


//// FIELDS / Thèmes
class  Field: Identifiable, ObservableObject  {
    let uuid = UUID()
    let id: Int
    let name:  String
    @Published var isUserPreferedField: Bool = false

    init(id: Int, name: String, isUserPreferedField: Bool) {
        self.id = id
        self.name = name
        self.isUserPreferedField = isUserPreferedField
    }
}


//struct  Field: Identifiable  {
//    let id = UUID()
//    let name:  String
//    var isUserPreferedField: Bool = false
//}

//let arrayOfFields[Fields] =

//struct  UserField: Identifiable  {
//    let    id = UUID()
//    var    favorite:    Bool
//    var    level:    Int
//}

//
////let chimie: Fields = Fields(name: "Chimie")
////let physique: Fields = Fields(name: "Physique")
////let espace: Fields = Fields(name: "Espace")
////let medecine: Fields = Fields(name: "Medecine")
////let sante: Fields = Fields(name: "Santé")
//let biologie: Fields = Fields(name: "Biologie")
//let mathematiques: Fields = Fields(name: "Mathématiques")
//let sciencesDeLaTerre: Fields = Fields(name: "Sciences De La Terre")
//let technologie: Fields = Fields(name: "Technologie")
//
//
//let arrayFields: Array<Fields> =
//[
////chimie
////,physique
////,espace
////,medecine
////,sante
////,
//biologie
//,mathematiques
//,sciencesDeLaTerre
//,technologie
//]
//
