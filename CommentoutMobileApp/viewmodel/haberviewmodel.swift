//
//  haberviewmodel.swift
//  CommentoutMobileApp
//
//  Created by Muhammed Selimhan gülsever on 2.04.2022.
//

import Foundation

struct haberListViewModel {
    
    let haberlisttutucu : [HaberElement]
    
    func numberOfRowsInSection() -> Int {
        return self.haberlisttutucu.count
    }
    func haberAtIndex(_ index: Int) -> HaberViewModel {
        let haber = self.haberlisttutucu[index]
        return HaberViewModel(habertutucu: haber)
    }
    func secilenhaber(_ index: Int) -> HaberViewModel {
        let secilen = self.haberlisttutucu[index]
        return HaberViewModel(habertutucu: secilen)
    }
}

struct HaberViewModel {
    let habertutucu : HaberElement
    
    var tittle: String {
        return self.habertutucu.title
    }
    var image: String {
        return self.habertutucu.mainImage.url
    }
    var summary: String {
        return self.habertutucu.summary
    }
    var content: String {
        return self.habertutucu.content
    }
    var noturl: String? {
        return self.habertutucu.shareURL
    }
    
}


