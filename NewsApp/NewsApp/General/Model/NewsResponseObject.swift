//
//  NewsResponseObject.swift
//  NewsApp
//
//  Created by Виктор Назаров on 9.05.23.
//

import Foundation

struct NewsResponseObject: Codable {
    let totalResults: Int
    let articles: [ArticleResponseObject]
    
    enum CodingKeys: CodingKey {
        case totalResults
        case articles
    }
}
