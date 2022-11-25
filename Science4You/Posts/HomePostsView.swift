//
//  HomePostsView.swift
//  Science4You
//
//  Created by Apprenant 62 on 21/10/2022.
//

import SwiftUI


struct HomePostsView: View {
    
    //@StateObject var myPostsViewModel = PostsViewModel()
    @EnvironmentObject var myPostsViewModel : PostsViewModel
    @State var isFullScreenCoverOpen: Bool = false
    
    var body: some View {
        NavigationView {
            
            ZStack (){
                VStack{
                    ScrollView(.vertical){
                        
                        VStack{
                            
                            /***/
                            //NEWS
                            NavigationLink(destination: PostsListFromTypeView(postType: "NEWS"), label: {
                                Text ("News")
                                    .foregroundColor(.black)
                                    .font(.title)
                                    .bold()
                                    .frame( width: 300, alignment: .leading)
                                Text("voir plus")
                                
                            })
                           

                            ScrollView(.horizontal){
                                
                                HStack(alignment: .top){
                                    
                                    ForEach( myPostsViewModel.arrayPosts.filter{ $0.type == "NEWS" }, id: \.self) { myPost in
                                        
                                        NavigationLink(destination: PostsDetailView(articleDetailed: myPost))
                                        {PostsItemMenu_View(prmPost: myPost, prmPostType: "NEWS")}
                                    }
                                    
                                }
                                
                            }
                            


                            // Le Saviez Vous ?
                            NavigationLink(destination: PostsListFromTypeView(postType: "LSV"), label: {
                                Text ("Le saviez-vous ?").foregroundColor(.black)
                                    .font(.title)
                                    .bold()
                                    .frame( width: 300, alignment: .leading)
                                Text("voir plus")
                            })
                            
                            ScrollView(.horizontal){
                                
                                HStack(alignment: .top){
                                    
                                    ForEach(myPostsViewModel.arrayPosts.filter{ $0.type == "LSV" }, id: \.self) { myPost in
                                        
                                        NavigationLink(destination: PostsDetailView(articleDetailed: myPost))
                                        {PostsItemMenu_View(prmPost: myPost, prmPostType: "LSV")}
                                    }
                                    
                                }
                                
                            }
                            
                            // Comment ça marche ?
                            NavigationLink(destination: PostsListFromTypeView(postType: "CCM"), label: {
                                Text ("Comment ça marche ?")
                                    .foregroundColor(.black)
                                    .font(.title)
                                    .bold()
                                    .frame( width: 300, alignment: .leading)
                                Text("voir plus")
                            })
                            
                            ScrollView(.horizontal){
                                
                                HStack(alignment: .top){
                                    
                                    ForEach(myPostsViewModel.arrayPosts.filter{ $0.type == "CCM" }, id: \.self) { myPost in
                                        
                                        NavigationLink(destination: PostsDetailView(articleDetailed: myPost))
                                        {PostsItemMenu_View(prmPost: myPost, prmPostType: "CCM")}
                                    }
                                    
                                }
                                
                            }
                            
                        }// Fin de VStack
                        
                    }
                    .toolbar(content: {
                        Button(action: {
                            isFullScreenCoverOpen = true
                        }, label: {
                            Image(systemName: "magnifyingglass")
                        })
                    })
                }
                .navigationTitle("Fil d'actus")
                .task {
                    //                    if !myPostsViewModel.isDataLoaded {
                    //                        await myPostsViewModel.dataLoadFromApi()
                    //                    }
                                        await myPostsViewModel.dataLoadFromApi()
                }
                
                if !myPostsViewModel.isDataLoaded{
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .black
                                                                    ))
                        .scaleEffect(4)
                }
                
            }.padding(.horizontal, 5)
            
            
        }
        .navigationTitle("Fil d'actus")
        
        
        
        .fullScreenCover(
            //isPresented: $isFullScreenCoverOpen,
            isPresented: $isFullScreenCoverOpen,
            content: {
            PostsSearchView(toggleFullScreen: $isFullScreenCoverOpen
                            , searchedText: String()
            )
        })
        
    }
    
}

struct PostsItemMenu_View: View {
    let prmPost: Post
    let prmPostType: String
    var body: some View {
        VStack(){
            
            
            
            
            Image(uiImage: prmPost.image.load())
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            
                .frame(width: 130, height: 130, alignment: .center)
            
                .clipped()
                .padding(.bottom)
            
            
            Text(prmPost.title.prefix(50) + "...")
            //.frame(width: 200)
            
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .frame(width: 130)
                .padding(.bottom)
            
            
        }
        
        
        
    }
}



struct HomePostsView_Previews: PreviewProvider {
    static var previews: some View {
        HomePostsView().environmentObject(PostsViewModel())
    }
}
