//
//  Utils+String.swift
//  ArticleApp
//
//  Created by Sanjay on 17/03/26.
//

import Foundation

extension String {

    func toFormattedDate() -> String {

        let inputFormatter = ISO8601DateFormatter()
        inputFormatter.formatOptions = [.withInternetDateTime]

        if let date = inputFormatter.date(from: self) {

            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd MMM, yyyy"

            return outputFormatter.string(from: date)
        }

        return self
    }
}
