//
//  ArticleProvider.swift
//  ArticleApp
//
//  Created by Sanjay on 17/03/26.
//

import Foundation

protocol ArticleProviderProtocol {
    func fetchArticles(completion: @escaping (Result<[Article], Error>) -> Void)
}

class ArticleProvider: ArticleProviderProtocol {
    
    func fetchArticles(completion: @escaping (Result<[Article], Error>) -> Void) {
        
        let url = "https://mocki.io/v1/50422b19-547f-41c0-b623-e82d886ad264"
        
        NetworkClient.shared.request(url) { (result: Result<ArticleResponse, Error>) in
            
            switch result {
            case .success(let response):
                completion(.success(response.articles))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
