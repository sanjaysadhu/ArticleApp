//
//  ArticleManager.swift
//  ArticleApp
//
//  Created by Sanjay on 17/03/26.
//

import Foundation

class ArticleManager {
    
    private let provider: ArticleProviderProtocol
    
    init(provider: ArticleProviderProtocol = ArticleProvider()) {
        self.provider = provider
    }
    
    func getArticles(completion: @escaping (Result<[Article], Error>) -> Void) {
        provider.fetchArticles(completion: completion)
    }
}
