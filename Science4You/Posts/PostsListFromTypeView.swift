//
//
//  PostsListFromTypeView.swift
//  Science4You
//
//  Created by Apprenant 62 on 24/10/2022.
//

import SwiftUI


struct PostsListFromTypeView: View {
    //@StateObject var myPostsViewModel = PostsViewModel()
    @EnvironmentObject var myPostsViewModel : PostsViewModel
    var postType: String
    
    var body: some View {
        
        
            
        List(myPostsViewModel.arrayPosts.filter{ $0.type == postType }){ myPost in
            ZStack{
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color.gray).opacity(0.15)
                
                VStack {
                    NavigationLink(destination: PostsDetailView(articleDetailed: myPost))
                    {PostsItem_View(prmPost: myPost)}
                    
                }
                //            .background(scrollColor)
                
            }
            
            .frame(width:400)
//            .cornerRadius(radius)
        }
        .scrollContentBackground(.hidden)
        
            .navigationTitle(postType)
            .task {
                //                    if !myPostsViewModel.isDataLoaded {
                //                        await myPostsViewModel.dataLoadFromApi()
                //                    }
                                    await myPostsViewModel.dataLoadFromApi()
            }
            

            if !myPostsViewModel.isDataLoaded{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .scaleEffect(4)
            }
    }
}




struct PostsListFromTypeView_Previews: PreviewProvider {
    static let myPostsViewModel = PostsViewModel()
    
    static var previews: some View {
        PostsListFromTypeView(postType: "NEWS").environmentObject(myPostsViewModel)
    }
}

























//
//
//
//
//
//struct PostsItem_View: View {
//
//    let prmPost: Post
//    let prmPostType: String
//
//    var body: some View {
//        ZStack{
//            //            RoundedRectangle(cornerRadius: 15)
//            //                .frame(width: 300, height: 120)
//            //                .foregroundColor(.black)
//
//            HStack{
////                Image(systemName: "scribble")
////                    .frame(width: 50, height: 50 )
////                    .border(.green)
////                    .foregroundColor(.black)
//                Image(uiImage: prmPost.image.load())
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//
//
//                    .frame(width: 100, height: 100, alignment: .center)
//
//                    .clipped()
//                    .padding(.bottom)
//
//                VStack{
//
//
//                    Text(dateFormatterUS(date: prmPost.date))
//                        .fontWeight(.light)
//
//                    //.foregroundColor(.white)
//                    //Spacer()
//
//                    Divider()
//
//                    Text(prmPost.title)
//                    //                        .foregroundColor(Color.white)
//                    //                        .bold()
//                    //                        .padding(.horizontal, 1.0)
//                }
//
//
//
//                Spacer()
//            }.padding(.all, 3.0)
//
//        }
//
//    }
//}
