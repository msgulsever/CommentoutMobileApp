//
//  haberviewmodel.swift
//  CommentoutMobileApp
//
//  Created by Muhammed Selimhan gülsever on 2.04.2022.
//

import Foundation

struct NewsListViewModel {
    
    let NewListHolder : [NewsElement]
    
    func numberOfRowsInSection() -> Int {
        return self.NewListHolder.count
    }
    func NewsAtIndex(_ index: Int) -> NewViewModel {
        let haber = self.NewListHolder[index]
        return NewViewModel(NewHolder: haber)
    }
    func ChoosenNew(_ index: Int) -> NewViewModel {
        let secilen = self.NewListHolder[index]
        return NewViewModel(NewHolder: secilen)
    }
}

struct NewViewModel {
    let NewHolder : NewsElement
    
    var tittle: String {
        return self.NewHolder.title
    }
    var image: String {
        return self.NewHolder.mainImage.url
    }
    var summary: String {
        return self.NewHolder.summary
    }
    var content: String {
        return self.NewHolder.content
    }
    var noturl: String? {
        return self.NewHolder.shareURL
    }
    
}


