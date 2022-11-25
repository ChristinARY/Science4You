//
//  FieldsViewModel.swift
//  Science4You
//
//  Created by Apprenant 62 on 24/10/2022.
//

import Foundation



class PostsViewModel: ObservableObject {
    
    
    @Published var arrayPosts = [Post]()
    @Published var isDataLoaded: Bool = false
    
    
    func dataLoadFromApi() async {
    
    if !isDataLoaded{
        // 1 - Url to fetch
        
        // Tous les posts triés par date
        guard let myUrl = URL(string: apiQuery_PostsSortedByDate
        ) else {
            return
        }
        
        
        
        // 2 - Create the request
        var request = URLRequest(url: myUrl)
        // 2.1 - Set the request method
        request.httpMethod = "GET"
        // 2.2 - Set the request header : authorization token
        request.setValue(
            apiAirTableToken,
            forHTTPHeaderField: apiForHTTPHeaderField
        )
        print(request)
        
        // 3 - Create the task to run
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                // handle error
                let _ = print("error :")
                print(error)
            } else if
                
                let myData = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200
                    
            {
                
                do {
                    let _ = print("No Error")
                    print("----------------------------------")
                    print("********** NO ERROR ************")
                    print("----------------------------------")
                    
                    print(myUrl)
                    print(myData)
                    print("----------------------------------")
                    print("********** OK ************")
                    print("----------------------------------")
                    // Decode JSON response
                    let response: PostsResponseDto = try JSONDecoder().decode(PostsResponseDto.self, from: myData)
                    
                    
                    // Empty data before filling it again
                    DispatchQueue.main.async {
                        self.arrayPosts = []
                    }
                    
                    print (self.arrayPosts.count)
                    
                    // Map dto to Posts and send it to main thread
                    for myRecord in response.records {
                        DispatchQueue.main.async {
                            
                            self.arrayPosts.append(
                                //Posts(type: record.fields.name)
                                Post(  id: myRecord.fields.P_Id
                                       , type: myRecord.fields.P_Type
                                       , title: myRecord.fields.P_Title
                                       , date: myRecord.fields.P_Date
                                       , auteur: myRecord.fields.P_Auteur
                                       //, image: myRecord.fields.P_Image
                                       //, image: myRecord.fields.P_StoredImage[0].url
                                       //, image: myRecord.fields.P_StoredImage[0].thumbnails.small.url
                                       , image: myRecord.fields.P_StoredImage[0].thumbnails.large.url

                                       , description: myRecord.fields.P_Description
                                       , theme: myRecord.fields.P_Theme
                                       , level: myRecord.fields.P_Level)
                                
                            )
                            
                            print("----------------------------------")
                            print("********** POST ************")
                            print("----------------------------------")
                            print(myRecord.fields.P_Id)
                            print(myRecord.fields.P_Type)
                            print("********** POST record ************")
                            print("----------------------------------")
                            print(myRecord)

                        }
                    }
                    
                    //Sert à executer une progress view pendant le chargement des données
                    //Problème : la progressview disparait alors que les images n'ont pas encore été chargées
                    self.isDataLoaded = true
                    
                    
                } catch {
                    // Handle error
                    print("----------------------------------")
                    print("********** Post Catched Error ************")
                    print("----------------------------------")
                    //print(self.myRecord)
                    print ("Problem while decoding")
                    print(error)
                }
                
                //self.isLoadingData = false
                
            }
            
        }
        
        // 4 - Launch the task
        task.resume()
    }//if isDataLoaded
    }

}







