//
//  ArticleGridCell.swift
//  ArticleApp
//
//  Created by Sanjay on 17/03/26.
//

import UIKit
import Kingfisher

class ArticleGridCell: UICollectionViewCell {
    
    // MARK: - Outlets

    @IBOutlet weak var vwBackground: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        vwBackground.layer.cornerRadius = 16
        vwBackground.backgroundColor = .darkTeal
        
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        
        titleLabel.numberOfLines = 2
    }
    
    func configure(with article: Article) {

        titleLabel.text = article.title
        titleLabel.font = AppFont.semiBold(16)
        titleLabel.textColor = .white
        
        if let urlString = article.urlToImage,
           let url = URL(string: urlString) {
            
            imageView.kf.setImage(
                with: url,
                placeholder: UIImage(named: "ic_placeholder")
            )
            
        } else {
            imageView.image = UIImage(named: "ic_placeholder")
        }

    }
}
