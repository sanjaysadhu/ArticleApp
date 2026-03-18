//
//  AppColors.swift
//  ArticleApp
//
//  Created by Sanjay on 17/03/26.
//

import Foundation
import UIKit

extension UIColor {

    // MARK: - Custom Colors

    static let primaryBlue = UIColor(hex: "#195A94")
    static let darkTeal = UIColor(hex: "#233D46")
    static let mediumGray = UIColor(hex: "#969696")

    // MARK: - Hex Initializer
    convenience init(hex: String) {
        let hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)

        if hexString.hasPrefix("#") {
            scanner.currentIndex = hexString.index(after: hexString.startIndex)
        }

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = CGFloat((rgb >> 16) & 0xFF) / 255.0
        let g = CGFloat((rgb >> 8) & 0xFF) / 255.0
        let b = CGFloat(rgb & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
