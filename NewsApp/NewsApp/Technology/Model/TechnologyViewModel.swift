//
//  TechnologyViewModel.swift
//  NewsApp
//
//  Created by Виктор Назаров on 16.05.23.
//

import Foundation

final class TechnologyViewModel: NewsListViewModel {
    
    override func loadData(searchText: String?) {
        super.loadData(searchText: searchText)
        
        ApiManager.getNews(from: .technology,
                           page: page,
                           searchText: searchText) { [weak self] result in
            self?.handleResult(result)
            
        }
    }
}
