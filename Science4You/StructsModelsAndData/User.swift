//
//  Profile.swift
//  Science4You
//
//  Created by PGO on 21/10/2022.
//

import Foundation



struct  User {
    let U_Id = UUID()
    // Gestion des préférences
    //let U_Fields: [UserField] //Tous les thèmes pas seulement les préférés
    
    //Gestion des favoris
//    let U_FavPosts: [Posts] // ?????
//    let U_FavExperiences: [Experiences] // ?????
//    let U_FavQuizz
    
    var U_Name:    String
    var U_Image:   String
    var U_Age:    Int
    var U_DisplayFavPosts:    Bool
    var U_DisplayFavExp:    Bool
}
