//
//  ArticleDetailVC.swift
//  ArticleApp
//
//  Created by Sanjay on 17/03/26.
//

import Kingfisher
import UIKit

class ArticleDetailVC: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgArticle: UIImageView!
    @IBOutlet weak var btnLIke: UIButton!
    @IBOutlet weak var lblDescription: UILabel!

    // MARK: - Variables

    var article: Article?
    private var isLiked = false

    // MARK: - Life Cycle Method

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        let imageName = isLiked ? "ic_dislike" : "ic_like"
        btnLIke.setImage(UIImage(named: imageName), for: .normal)
        imgArticle.layer.cornerRadius = 16
        imgArticle.clipsToBounds = true
        setupData()
    }

    private func setupData() {
        guard let article = article else { return }

        lblTitle.text = article.title
        lblDescription.text = article.description

        if let urlString = article.urlToImage,
            let url = URL(string: urlString)
        {

            imgArticle.kf.setImage(
                with: url,
                placeholder: UIImage(named: "ic_placeholder")
            )
        } else {
            imgArticle.image = UIImage(named: "ic_placeholder")
        }
    }

    // MARK: - Button Action

    @IBAction func btnBackCliked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func btnLikeCliked(_ sender: UIButton) {
        isLiked.toggle()
        let imageName = isLiked ? "ic_like" : "ic_dislike"
        btnLIke.setImage(UIImage(named: imageName), for: .normal)
    }

}
