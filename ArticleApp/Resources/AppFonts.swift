//
//  AppFonts.swift
//  ArticleApp
//
//  Created by Sanjay on 17/03/26.
//

import Foundation
import UIKit

struct AppFont {

    static func regular(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: size)
            ?? UIFont.systemFont(ofSize: size)
    }

    static func medium(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Medium", size: size)
            ?? UIFont.systemFont(ofSize: size)
    }

    static func bold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: size)
            ?? UIFont.boldSystemFont(ofSize: size)
    }

    static func semiBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-SemiBold", size: size)
            ?? UIFont.systemFont(ofSize: size, weight: .light)
    }
}
