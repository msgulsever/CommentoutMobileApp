//
//  WebServiceWithAlamofire.swift
//  CommentoutMobileApp
//
//  Created by Muhammed Selimhan gülsever on 8.04.2022.
//

import Foundation
import Alamofire

class WebServiceWithAlamofire {
    
    weak var vc:ViewController?
    var Holder = [NewsElement]()
    
    func GetAllDataAF(){
        AF.request("http://www.mocky.io/v2/59cc13f726000062106b773d")
            .response { response in
                if let data = response.data {
                    do {
                        let userResponse = try
                        JSONDecoder().decode([NewsElement].self, from: data)
                        self.Holder.append(contentsOf: userResponse)
                        DispatchQueue.main.async {
                            self.vc?.table.reloadData()
                        }
                        
                    }catch let err{
                        print(err.localizedDescription)
                    }
                }
            }
    }
}
