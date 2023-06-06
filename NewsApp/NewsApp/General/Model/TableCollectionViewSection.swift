//
//  TableCollectionViewSection.swift
//  NewsApp
//
//  Created by Виктор Назаров on 11.05.23.
//

import Foundation


protocol TableCollectionViewItemsProtocol { }

struct TableCollectionViewSection {
    var title: String?
    var items: [TableCollectionViewItemsProtocol]
}
