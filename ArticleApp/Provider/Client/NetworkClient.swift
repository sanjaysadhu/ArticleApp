//
//  NetworkClient.swift
//  ArticleApp
//
//  Created by Sanjay on 17/03/26.
//

import Alamofire
import Foundation
import XCGLogger

class NetworkClient {

    static let shared = NetworkClient()
    private let logger = XCGLogger.default

    private init() {}

    func request<T: Decodable>(
        _ url: String,
        method: HTTPMethod = .get,
        completion: @escaping (Result<T, Error>) -> Void
    ) {

        logger.info("Request URL: \(url)")

        AF.request(url, method: method).responseDecodable(of: T.self) {
            response in

            switch response.result {
            case .success(let data):
                self.logger.info("Success Response")
                completion(.success(data))

            case .failure(let error):
                self.logger.error("Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
