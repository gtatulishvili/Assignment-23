//
//  Article.swift
//  NewsAPP
//
//  Created by Gega on 4/19/24.
//

import Foundation

struct Article: Codable {
    let title: String
    let time: String
    let url: String
    let type: Int
    let photoUrl: String
    let photoAlt: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case time = "Time"
        case url = "Url"
        case type = "Type"
        case photoUrl = "PhotoUrl"
        case photoAlt = "PhotoAlt"
    }
}
