//
//  haberviewmodel.swift
//  CommentoutMobileApp
//
//  Created by Muhammed Selimhan gülsever on 2.04.2022.
//

import Foundation

struct NewsListViewModel {
    
    let NewListHolder : [NewsElement]
    func ChoosenNew(_ index: Int) -> NewViewModel {
        let Choosen = self.NewListHolder[index]
        return NewViewModel(NewHolder: Choosen)
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


