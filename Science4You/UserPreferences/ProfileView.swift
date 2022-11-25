//
//  ProfileView.swift
//  Science4You
//
//  Created by Apprenant 62 on 21/10/2022.
//

import SwiftUI

struct PreferencesFieldItemView: View {
    
    @ObservedObject var prmField: Field
    //var prmField: Field
    
    @State var isUserPreferedField = false
    
    var body: some View {
        ZStack{

            HStack{
                VStack(){
                    
                    Text(prmField.name).foregroundColor(Color.black).bold()
                }.padding(.leading)
                


//                Toggle(isOn: prmField.$isUserPreferedField) {
//                }
//                
                
//
                //Spacer()
                
                Toggle(isOn: $isUserPreferedField) {
                }
                    
                
//                Toggle(isOn: $isUserPreferedField) {
//                }.toggleStyle(SwitchToggleStyle(tint: .red))
//
//                Toggle(isOn: prmField.isUserPreferedField) {
//                }
                    
//                Toggle(isOn: $isUserPreferedField) {
//                }
//                .onChange(of: $isUserPreferedField){
//
//                }

                
                //Spacer()
            }
        }

            
    }
}

struct ProfileView: View {
    @StateObject var myFieldsViewModel = FieldsViewModel()
    
    var body: some View {
        
        ZStack(){
            VStack(){
                
                //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
                NavigationView {
                    List(myFieldsViewModel.arrayFields) { myField in
                        HStack {
                            
                            PreferencesFieldItemView(prmField: myField)
                          
                        }
                        
                    }
                    .navigationTitle("Préférences")
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
            }
        }
//        .onAppear{
//            initialisation()
//        }
            
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
