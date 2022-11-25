//
//  FieldsResponseDto.swift
//  Science4You
//
//  Created by Apprenant 62 on 24/10/2022.
//

import Foundation

struct FieldsResponseDto: Decodable {
    let records: [RecordDto]
    
    struct RecordDto: Decodable {
        let id: String
        let fields: FieldsDto
    }
    
    struct FieldsDto: Decodable {
        let F_Id: Int
        let F_Name: String
    }
    
}
