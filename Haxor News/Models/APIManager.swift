//
//  apiManager.swift
//  Haxor News
//
//  Created by user167809 on 4/13/20.
//  Copyright © 2020 user167809. All rights reserved.
//

import Foundation

class APIManager: ObservableObject {
    
@Published    var messages = [Post]()
    let decoder = JSONDecoder()
    
    func performRequest() {
    if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error ?? "something goes wrong")
                return
            } else {
                if let safeData = data{
                do{
                    let decodedData = try self.decoder.decode(APIStruct.self, from: safeData)
                    DispatchQueue.main.async{
                    self.messages = decodedData.hits
                    }
                } catch {
                    print(error)
                }
                }
            }
        }
        task.resume()
}
}
}
