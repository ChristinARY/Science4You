//
//  PostsResponseDto.swift
//  Science4You
//
//  Created by Apprenant 62 on 24/10/2022.
//

import Foundation

struct PostsResponseDto: Decodable {
    let records: [PostRecordDto]
    
    struct PostRecordDto: Decodable {
        let id: String
        let fields: PostDto
    }
    
    struct PostDto: Decodable {
        let    P_Id:            Int
        let    P_Type:          String
        let    P_Title:         String
        let    P_Date:          Int
        let    P_Auteur:        String
        let    P_StoredImage:   [ImageDto]
        let    P_Image:         String
        let    P_Description:   String
        let    P_Theme:         String
        let    P_Level:         Int    }
    
    struct ImageDto: Decodable{
        let url: String
        let thumbnails: thumbnailDto
        
    }
    
    struct thumbnailDto: Decodable{
        let small: dataDto
        let large: dataDto
        let full: dataDto
        
    }
    
    struct dataDto: Decodable{
        let url: String
        let width: Int
        let height: Int
    }
    
//    
//    "url": "https://dl.airtable.com/.attachmentThumbnails/af38ddaf702dd9c831a06e8fd93c04d2/5b6aac5c",
//     "width": 36,
//     "height": 36
    
}
