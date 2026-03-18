//
//  Article.swift
//  ArticleApp
//
//  Created by Sanjay on 17/03/26.
//

import Foundation

struct ArticleResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String?
    let description: String?
    let urlToImage: String?
    let publishedAt: String?
}
