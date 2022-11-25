//
//  ExperiencesResponseDto.swift
//  Science4You
//
//  Created by Audrey Mo on 31/10/2022.
//


import Foundation

struct ExperiencesResponseDto: Decodable {
    let records: [ExperiencesRecordDto]
    
    struct ExperiencesRecordDto: Decodable {
        let id: String
        let fields: ExperiencesDto
    }
    
    struct ExperiencesDto: Decodable {
        //let    d:               String
        let    E_Id:            Int
        
        let    E_Title:         String
        let    E_Image:         String
        let    E_Description:   String
        let    E_Level:         Int
        let    E_F_Id:          Int
    }
}

