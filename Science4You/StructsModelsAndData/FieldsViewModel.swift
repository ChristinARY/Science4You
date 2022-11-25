//
//  FieldsViewModel.swift
//  Science4You
//
//  Created by Apprenant 62 on 24/10/2022.
//

import Foundation



class FieldsViewModel: ObservableObject {
    
    
    @Published var arrayFields = [Field]()
    
    func getDataFromAirTable() async {
        
        // 1 - Url to fetch

        guard let myUrl = URL(string:
                                apiQuery_FieldsSortedByName
                              //"https://api.airtable.com/v0/appw0yAtNN9Yczf5F/Fields?sort%5B0%5D%5Bfield%5D=F_Name&sort%5B0%5D%5Bdirection%5D=asc"
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
        
        // 3 - Create the task to run
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                // handle error
                print(error)
            } else if
                let myData = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                
                do {
                    // Decode JSON response
                    let response: FieldsResponseDto = try JSONDecoder().decode(FieldsResponseDto.self, from: myData)
                    
                    // Empty data before filling it again
                    DispatchQueue.main.async {
                        self.arrayFields = []
                    }
                    
                    // Map dto to Fields and send it to main thread
                    for record in response.records {
                        DispatchQueue.main.async {
                            self.arrayFields.append(
                                Field(id: record.fields.F_Id
                                    ,name: record.fields.F_Name
                                    ,isUserPreferedField: false
                                     )
                                
                            )
                            print("----------------------------------")
                            print("********** Fields ************")
                            print("----------------------------------")

                            print(record.fields.F_Id)
                            print(record.fields.F_Name)
                            print("********** Fields record ************")
                            print("----------------------------------")
                            print(record)
                            
                        }
                    }
                } catch {
                    // Handle error
                    // Handle error
                    print("----------------------------------")
                    print("********** Fields Catched Error ************")
                    print("----------------------------------")
                    //print(self.myRecord)
                    print ("Problem while decoding")
                    print(error)
                }

            }
            
        }
        
        // 4 - Launch the task
        task.resume()
        
    }

}
