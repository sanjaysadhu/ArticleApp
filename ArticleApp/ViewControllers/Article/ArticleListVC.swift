//
//  ArticleListVC.swift
//  ArticleApp
//
//  Created by Sanjay on 17/03/26.
//

import Reachability
import UIKit

class ArticleListVC: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var offlineView: UIView!
    @IBOutlet weak var btnGrid: UIButton!

    // MARK: - Variables

    private let manager = ArticleManager()
    private var articles: [Article] = []
    private var isGridView = false
    private let cacheKey = "cached_articles"
    private var reachability: Reachability?

    // MARK: - Life Cycle Method

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageName = isGridView ? "ic_lists" : "ic_grid"
        btnGrid.setImage(UIImage(named: imageName), for: .normal)
        
        offlineView.isHidden = true
        setupCollectionView()
        startMonitoring()
        fetchArticles()
    }

    // MARK: - Setup

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(
            UINib(nibName: "ArticleCollectionCell", bundle: nil),
            forCellWithReuseIdentifier: "ArticleCollectionCell"
        )

        collectionView.register(
            UINib(nibName: "ArticleGridCell", bundle: nil),
            forCellWithReuseIdentifier: "ArticleGridCell"
        )
    }

    // MARK: - API Call

    private func fetchArticles() {
        collectionView.isHidden = true

        manager.getArticles { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {

                switch result {
                case .success(let data):
                    self.articles = data

                    self.saveToCache(data)

                    self.offlineView.isHidden = true
                    self.collectionView.isHidden = false
                    self.collectionView.reloadData()

                case .failure:

                    if let cached = self.loadFromCache() {
                        self.articles = cached

                        self.offlineView.isHidden = false
                        self.collectionView.isHidden = false
                        self.collectionView.reloadData()

                    } else {
                        self.offlineView.isHidden = false
                        self.collectionView.isHidden = true
                    }
                }
            }
        }
    }

    // MARK: - Cache

    private func saveToCache(_ articles: [Article]) {
        if let encoded = try? JSONEncoder().encode(articles) {
            UserDefaults.standard.set(encoded, forKey: cacheKey)
        }
    }

    private func loadFromCache() -> [Article]? {
        if let data = UserDefaults.standard.data(forKey: cacheKey),
            let articles = try? JSONDecoder().decode([Article].self, from: data)
        {
            return articles
        }
        return nil
    }

    // MARK: - Reachability

    private func startMonitoring() {

        reachability = try? Reachability()

        reachability?.whenReachable = { [weak self] _ in
            DispatchQueue.main.async {
                print("Internet Available")
                self?.fetchArticles()
            }
        }

        reachability?.whenUnreachable = { [weak self] _ in
            DispatchQueue.main.async {
                print("No Internet")
                self?.offlineView.isHidden = false
            }
        }

        try? reachability?.startNotifier()
    }

    // MARK: - Button Actions

    @IBAction func btnGridAction(_ sender: UIButton) {

        isGridView.toggle()

        let imageName = isGridView ? "ic_lists" : "ic_grid"
        btnGrid.setImage(UIImage(named: imageName), for: .normal)

        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.reloadData()
    }

    @IBAction func btnRetryCliked(_ sender: UIButton) {
        fetchArticles()
    }
}

// MARK: - CollectionView

extension ArticleListVC: UICollectionViewDelegate, UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return articles.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let article = articles[indexPath.item]

        if isGridView {
            let cell =
                collectionView.dequeueReusableCell(
                    withReuseIdentifier: "ArticleGridCell",
                    for: indexPath
                ) as! ArticleGridCell

            cell.configure(with: article)
            return cell

        } else {
            let cell =
                collectionView.dequeueReusableCell(
                    withReuseIdentifier: "ArticleCollectionCell",
                    for: indexPath
                ) as! ArticleCollectionCell

            cell.delegate = self
            cell.configure(with: article)
            return cell
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {

        let selectedArticle = articles[indexPath.item]

        let vc =
            storyboard?.instantiateViewController(
                withIdentifier: "ArticleDetailVC"
            ) as! ArticleDetailVC
        vc.article = selectedArticle

        navigationController?.pushViewController(vc, animated: true)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {

        let padding: CGFloat = 12 * 2
        let spacing: CGFloat = 8

        let width = collectionView.frame.width - padding

        if isGridView {
            let itemWidth = (width - spacing) / 2
            return CGSize(width: itemWidth, height: 170)
        } else {
            return CGSize(width: width, height: 350)
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 8
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 8
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {

        if isGridView {
            return UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        } else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }

    }
}

// MARK: - Cell Delegate

extension ArticleListVC: ArticleCollectionCellDelegate {

    func didTapReadMore(_ cell: ArticleCollectionCell) {

        if let indexPath = collectionView.indexPath(for: cell) {
            let article = articles[indexPath.item]

            let vc =
                storyboard?.instantiateViewController(
                    withIdentifier: "ArticleDetailVC"
                ) as! ArticleDetailVC
            vc.article = article

            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
