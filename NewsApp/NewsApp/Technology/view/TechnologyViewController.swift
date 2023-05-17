//
//  TechnologyViewController.swift
//  NewsApp
//
//  Created by Виктор Назаров on 27.04.23.
//

import UIKit

final class TechnologyViewController: UIViewController {
    // MARK: - GUI variables
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let width = (view.frame.width - 15) / 2
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    // MARK: - Properties
    private var viewModel: NewsListViewModelProtocol
    
    // MARK: - Life cycle
    init(viewModel: NewsListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        collectionView.register(TechnologyViewCell.self, forCellWithReuseIdentifier: "TechnologyViewCell")
        
        collectionView.keyboardDismissMode = .onDrag
        
        viewModel.loadData(searchText: nil)
    }
    // MARK: - Methods
    
    // MARK: - Private methods
    private func setupViewModel() {
        viewModel.reloadData = { [weak self] in
            self?.collectionView.reloadData()
        }
        
        viewModel.reloadCell = { [weak self] indexPath in
            self?.collectionView.reloadItems(at: [indexPath])
        }
        
        viewModel.showError = { error in
            print(error)
        }
    }
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
    collectionView.snp.makeConstraints { make in
        make.center.equalToSuperview()
        }
    }
}

extension TechnologyViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let article = viewModel.sections[indexPath.section].items[indexPath.row] as? ArticleCellViewModel else { return }
        navigationController?.pushViewController(NewsViewController(viewModel: NewsViewModel(article: article)), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (viewModel.sections[0].items.count - 12) {
            viewModel.loadData(searchText: nil)
        }
    }
}

extension TechnologyViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let article = viewModel.sections[indexPath.section].items[indexPath.row] as? ArticleCellViewModel, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GeneralCollectionViewSell", for: indexPath) as? GeneralCollectionViewSell else { return UICollectionViewCell() }
        
        cell.set(article: article)
        
        return cell
    }
}

