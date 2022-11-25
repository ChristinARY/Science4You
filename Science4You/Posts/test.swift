//
//  PostsSearch.swift
//  Science4You
//
//  Created by Apprenant 62 on 27/10/2022.
//


import SwiftUI


struct TESTView: View {
    @StateObject var myPostsViewModel = PostsViewModel()
    
    
    var body: some View {
   
            VStack{
                  //affiche la liste des posts dont la description contient le mot recherché
                
                
                Text("NavigationLink(destination: PostsDetailView(articleDetailed: myPost))")
                
                
                
                
                List(myPostsViewModel.arrayPosts
//                    .filter({ searchedText.isEmpty ? true : $0.description.lowercased().contains(searchedText.lowercased()) })

                )
                { myPost in
                    VStack {
                        
                        Text("NavigationLink(destination: PostsDetailView(articleDetailed: myPost))")

                        NavigationLink(destination: PostsDetailView(articleDetailed: myPost))
                        {PostsItem_View(prmPost: myPost)}

                    }

                }
                .task {
                    await myPostsViewModel.dataLoadFromApi()

                }
                
                Spacer()
            }
        

        
        
        
        
        
        
        
        
        
        
        
        
    }//var body: some View {
}// Struct



struct TESTView_Previews: PreviewProvider {
    
    static var previews: some View {
        TESTView(myPostsViewModel: PostsViewModel()
                        
                        
        )
//        PostsSearchView((myPostsViewModel: PostsViewModel(), toggleFullScreen: .constant(true)))
    }
}








