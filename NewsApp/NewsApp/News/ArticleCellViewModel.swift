//
//  ArticleCellViewModel.swift
//  NewsApp
//
//  Created by Виктор Назаров on 9.05.23.
//

import Foundation

final
class ArticleCellViewModel: TableCollectionViewItemsProtocol {
    let title: String
    let description: String
    var date: String
    var imageData: Data?
    var imageUrl: String?
    
    init(article: ArticleResponseObject) {
        title = article.title ?? ""
        description = article.description ?? ""
        date = article.date ?? ""
        imageUrl = article.urlToImage
        
        if let formatDate = formatDate(dateStr: self.date) {
            self.date = formatDate
        }
    }
    
    private func formatDate(dateStr: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: dateStr) else { return nil}
        
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
}
