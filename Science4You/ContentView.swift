//
//  ContentView.swift
//  Science4You
//
//  Created by Apprenant 62 on 20/10/2022.
//

import SwiftUI

struct ContentView: View {
    //let cBackgroundColor:Color  = Color("darkblue")
    //let cMarine:Color           = Color("marine")
    //let cLightGreen:Color       = Color("lightgreen")
    
    @State private var selectedTab:Int = 0
    
//    init(){
//        //UITabBar.appearance().backgroundColor = UIColor(cBackgroundColor)
//        UITabBar.appearance().barTintColor = UIColor(cBackgroundColor)
//    }
    
    
    
    var body: some View {
        
        TabView (selection:$selectedTab){
            
            
            
            //HomePostsView()
            HomePostsView()
                .tabItem() {
                    Label("Posts", systemImage: "newspaper")
                }.tag(0)
            
//            PostsSearchView(myPostsViewModel: PostsViewModel()
//                            , toggleFullScreen: .constant(false)
//                            , searchedText: String())
//                .tabItem()
//                {
//                    Label("Recherche", systemImage: "magnifyingglass")
//                }.tag(1)
            
            
            QuizzesView()
                .tabItem() {
                    Label("Quiz", systemImage: "questionmark.circle")
                }.tag(1)
            
//            FieldChoiceView(prm_quizz_or_exp: "QUIZZ")
//                .tabItem() {
//                    Label("Quiz", systemImage: "questionmark.circle")
//                }.tag(1)

            FieldChoiceView(prm_quizz_or_exp: "EXP")
                .tabItem() {
                    Label("Expériences", systemImage: "testtube.2")
                }.tag(2)


            
            ProfileView()
                .tabItem()
                {
                    //Label("Profil", systemImage: "person.circle.fill")
                    Label("Préférences", systemImage: "gearshape.fill")
                }.tag(3)
        }//.background(.black)
        .foregroundColor(.black)
        .toolbarBackground(.red, for: .tabBar)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
