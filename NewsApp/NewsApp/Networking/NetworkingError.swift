//
//  NetworkingError.swift
//  NewsApp
//
//  Created by Виктор Назаров on 9.05.23.
//

import Foundation

enum NetworkingError: Error {
    case networkingError(_ error: Error)
    case unknown
}
