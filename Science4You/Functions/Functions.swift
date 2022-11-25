//
//  Functions.swift
//  Science4You
//
//  Created by Apprenant 62 on 24/10/2022.
//

import Foundation
import SwiftUI

func initialisation () {
    print("J'ai commencé l'initialisation dans Science4YouApp.swift : init() ")
}

func dateFormatterUS(date: Int) -> String {
    // Format the date into a string
    let inputDate = String(date)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyyMMdd"
    
    let formattedInputDate = dateFormatter.date(from: inputDate)!
    
    let dateFormatter2 = DateFormatter()
    dateFormatter2.dateFormat = "d MMMM y"
    dateFormatter2.locale = Locale(identifier: "fr_FR")
    
    return dateFormatter2.string(from: formattedInputDate)
}


extension String{
    func load() -> UIImage{
        //Try Catch block
        do {
            
            //convertir unes Srting en url
            guard let url = URL(string: self)
            else {
                
                //renvoie une image vide si l'URL n'est pas valide
                return UIImage()
                
            }
            
            //convertir l'URL en données
            
            let data: Data =
                try Data(contentsOf: url)
            //créer un objet UIImage à partir de Data
            //et une
            return UIImage(data: data) ?? UIImage()
            
        }
        catch{
            
        }
        
        return UIImage()
    }
}
