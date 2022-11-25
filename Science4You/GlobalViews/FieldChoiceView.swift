//
//  FieldChoiceView.swift
//  Science4You
//
//  Created by Apprenant 62 on 21/10/2022.
//

import SwiftUI

struct FieldItemView: View {
    
    let prmField: Field
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 300, height: 80)
                .foregroundColor(.black)
            
            HStack{
                Text(prmField.name).foregroundColor(Color.white).bold()
                //NavigationLink(QuizzListView())
                
                //Spacer()
            }
        }
            
    }
}


struct FieldChoiceView: View {
    
    @StateObject var myFieldsViewModel = FieldsViewModel()
    //let sortedFields = myFieldsViewModel.sort{$0.name < $1.name}
    
    var prm_quizz_or_exp: String
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        //Text("Choix du thème de votre ")
        
        NavigationView {
            List(myFieldsViewModel.arrayFields) { myField in
                HStack {
                    
                    if prm_quizz_or_exp == "EXP"{
                        NavigationLink(destination: ExperiencesListView()){FieldItemView(prmField: myField)}
                    }
                    else if prm_quizz_or_exp == "QUIZZ"{
                        NavigationLink(destination: QuizzesView()){FieldItemView(prmField: myField)}
                    }
                    
//                    NavigationLink(destination: QuizzListView()){FieldItemView(prmField: myField)}
                }
                
            }
            .navigationTitle("Choix du thème")
            .onAppear {
                Task {
                    await myFieldsViewModel.getDataFromAirTable()
                }
            }
            .refreshable {
                Task {
                    await myFieldsViewModel.getDataFromAirTable()
                }
            }
        }
  
        
//        NavigationView {
//            List(myFieldsViewModel.arrayFields) { myField in
//                HStack {
//
//                    FieldItemView(prmField: myField)
//                }
//
//            }
//            .navigationTitle("Choix thème \(prm_quizz_or_exp)")
//            .onAppear {
//                Task {
//                    await myFieldsViewModel.fetchFields()
//                }
//            }
//            .refreshable {
//                Task {
//                    await myFieldsViewModel.fetchFields()
//                }
//            }
//        }
//
        
        
        
        
        
//        NavigationView {
//
//
//
//
//            ScrollView {
//                ForEach(myFieldsViewModel.fields) { myField in
//
//                    //Divider()
//
//                    FieldItemView(prmField: myField)
//                    //Text(countryForItem.code.uppercased())
//                    //CountryItem(countryForItem: country)
//                }
//            }
//            .navigationTitle("Choix thème \(prm_quizz_or_exp)")
//
//
//
//
//        }
        
        
        
        
        

        

        
    }
}

struct FieldChoiceView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        FieldChoiceView(prm_quizz_or_exp: "EXP")
    }
}


