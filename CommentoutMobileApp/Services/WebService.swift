//
//  webservice.swift
//  CommentoutMobileApp
//
//  Created by Muhammed Selimhan gülsever on 2.04.2022.
//

import Foundation

/*
class Webservice {
    
    func downloadinfos (url : URL, completion : @escaping ([NewsElement]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                let haberlist = try? JSONDecoder().decode([NewsElement].self, from: data)
                if let haberlist = haberlist {
                    completion(haberlist)
                }
            }
        }.resume()
    }
}
*/
