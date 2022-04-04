//
//  model.swift
//  CommentoutMobileApp
//
//  Created by Muhammed Selimhan gülsever on 2.04.2022.
//

import Foundation

struct HaberElement: Codable {
    let uuid, title, summary, content: String
    let mainImage: MainImage
    let shareURL: String?
    let jsonURL: String?

    enum CodingKeys: String, CodingKey {
        case uuid, title, summary, content
        case mainImage = "main_image"
        case shareURL = "share_url"
        case jsonURL = "json_url"
    }
}

struct MainImage: Codable {
    let url: String
    let height, width: Int
}

typealias Haber = [HaberElement]


