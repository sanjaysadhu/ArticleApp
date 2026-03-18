//
//  ArticleCollectionCell.swift
//  ArticleApp
//
//  Created by Sanjay on 17/03/26.
//

import Kingfisher
import UIKit

protocol ArticleCollectionCellDelegate: AnyObject {
    func didTapReadMore(_ cell: ArticleCollectionCell)
}

class ArticleCollectionCell: UICollectionViewCell {
    
    // MARK: - Outlets

    @IBOutlet weak var vwBackground: UIView!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var readMoreButton: UIButton!
    @IBOutlet weak var imgCalendar: UIImageView!
    
    // MARK: - Variables
    
    weak var delegate: ArticleCollectionCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        vwBackground.layer.cornerRadius = 16
        vwBackground.backgroundColor = .darkTeal
        articleImageView.layer.cornerRadius = 16
        articleImageView.clipsToBounds = true
        setupReadMoreButton()

    }
    
    private func setupReadMoreButton() {
        
        var config = UIButton.Configuration.filled()
        config.title = "Read More"
        config.image = UIImage(named: "ic_right_arrow")
        config.imagePlacement = .trailing
        config.imagePadding = 10
        config.baseBackgroundColor = .primaryBlue
        
        var attributedTitle = AttributedString("Read More")
        attributedTitle.font = AppFont.semiBold(13)
        
        config.attributedTitle = attributedTitle
        config.baseForegroundColor = .white
        config.cornerStyle = .large
        readMoreButton.configuration = config
    }

    func configure(with article: Article) {

        titleLabel.text = article.title
        titleLabel.font = AppFont.semiBold(16)
        titleLabel.textColor = .white
        dateLabel.textColor = .mediumGray
        dateLabel.font = AppFont.medium(12)
        dateLabel.text = article.publishedAt
        
        if let publishedAt = article.publishedAt {
            dateLabel.text = publishedAt.toFormattedDate()
        } else {
            dateLabel.text = ""
        }

        if let urlString = article.urlToImage,
           let url = URL(string: urlString) {
            
            articleImageView.kf.setImage(
                with: url,
                placeholder: UIImage(named: "ic_placeholder")
            )
            
        } else {
            articleImageView.image = UIImage(named: "ic_placeholder")
        }

    }
    
    @IBAction func readMoreTapped(_ sender: UIButton) {
        delegate?.didTapReadMore(self)
    }
}
