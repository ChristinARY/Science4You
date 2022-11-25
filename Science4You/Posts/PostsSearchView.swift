//
//  PostsSearch.swift
//  Science4You
//
//  Created by Apprenant 62 on 27/10/2022.
//


import SwiftUI




struct PostsSearchView: View {
    //@StateObject var myPostsViewModel = PostsViewModel()
    @EnvironmentObject var myPostsViewModel : PostsViewModel
    
    @Binding var toggleFullScreen: Bool
    
    @State  var searchedText: String
    
    var body: some View {
        NavigationView{
            VStack(){
                SearchBar(text: $searchedText, toggleFullScreen: $toggleFullScreen)
                
                //affiche la liste des posts dont la description contient le mot recherché
                List(myPostsViewModel.arrayPosts
                    .filter({ searchedText.isEmpty ? true : $0.description.lowercased().contains(searchedText.lowercased()) })
                     
                )
                { myPost in
                    HStack {
                        
                        NavigationLink(destination: PostsDetailView(articleDetailed: myPost))
                        {PostsItem_View(prmPost: myPost)}
                        
                    }
                    
                }
                .task {
//                    if !myPostsViewModel.isDataLoaded {
//                        await myPostsViewModel.dataLoadFromApi()
//                    }
                    await myPostsViewModel.dataLoadFromApi()
                }
                
                if !myPostsViewModel.isDataLoaded{
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .scaleEffect(4)
                }
                
                Spacer()
            }
            
            
        }
        

        
        
        
        
        
        
        
        
        
        
        
        
    }//var body: some View {
}// Struct



struct PostsSearchView_Previews: PreviewProvider {
    
    static var previews: some View {
        PostsSearchView(toggleFullScreen: .constant(true)
                                , searchedText: String()
                )
//        PostsSearchView(myPostsViewModel: PostsViewModel()
//                        , toggleFullScreen: .constant(true)
//                        , searchedText: String()
//        )
//        PostsSearchView((myPostsViewModel: PostsViewModel(), toggleFullScreen: .constant(true)))
    }
}





struct SearchBar: View {
    @Binding var text: String
    @Binding var toggleFullScreen: Bool
 
    @State private var isEditing = false
 
    var body: some View {
        ZStack{
            //Color(.black)
            
            HStack {
                
                Button("Close") {
                    toggleFullScreen = false
                }
                .padding(.leading)
                
                //Search TextField
                TextField("Rechercher", text: $text)
                    .textCase(.lowercase)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                     
                            if isEditing {
                                Button(action: {
                                    self.text = ""
                                    

                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        self.isEditing = true
                    }
                
                
                    if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.text = ""
                        //self.toggleFullScreen = false
                    }) {
                        Text("Cancel")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    //.animation(.default)
                   
                    
                }
            }
        }
    }
}







