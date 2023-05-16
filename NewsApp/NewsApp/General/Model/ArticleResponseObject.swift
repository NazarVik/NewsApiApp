//
//  ArticleResponseObject.swift
//  NewsApp
//
//  Created by Виктор Назаров on 9.05.23.
//

import Foundation

struct ArticleResponseObject: Codable {
    let title: String?
    let description: String?
    let urlToImage: String?
    let date: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case urlToImage
        case date = "publishedAt"
    }
}
