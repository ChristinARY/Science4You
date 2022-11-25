//
//  ExperiencesViewModel.swift
//  Science4You
//
//  Created by Audrey Mo on 31/10/2022.
//


import Foundation



class ExperiencesViewModel: ObservableObject {
    
    
    @Published var arrayExperiences = [Experiences]()
    @Published var isDataLoaded: Bool = false
    
    
    func dataLoadFromApi() async {
    
    if !isDataLoaded{
        // 1 - Url to fetch
        
        // Tous les posts triés par date
        guard let myUrl = URL(string: apiQuery_Experience
                              
                              //"https://api.airtable.com/v0/appw0yAtNN9Yczf5F/Posts?sort%5B0%5D%5Bfield%5D=P_Date&sort%5B0%5D%5Bdirection%5D=desc"
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
                    let response: ExperiencesResponseDto = try JSONDecoder().decode(ExperiencesResponseDto.self, from: myData)
                    
                    
                    // Empty data before filling it again
                    DispatchQueue.main.async {
                        self.arrayExperiences = []
                    }
                    
                    print (self.arrayExperiences.count)
                    
                    // Map dto to Posts and send it to main thread
                    for myRecord in response.records {
                        DispatchQueue.main.async {
                            
                            self.arrayExperiences.append(
                                //Posts(type: record.fields.name)
                                Experiences(title: myRecord.fields.E_Title,
                                            image: myRecord.fields.E_Image,
                                            description: myRecord.fields.E_Description,
                                            level: myRecord.fields.E_Level,
                                            fieldId: myRecord.fields.E_F_Id)
                            )
                            
                            print("----------------------------------")
                            print("********** exp ************")
                            print("----------------------------------")
                            print(myRecord.fields.E_Id)
                            print(myRecord.fields.E_Title)
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
                    print("********** Experiences Catched Error ************")
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







