//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Виктор Назаров on 1.05.23.
//

import Foundation
import UIKit

final class NewsViewController: UIViewController {
    // MARK: - GUI variables
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
//        view.image = UIImage(named: "1") ?? UIImage.add
    
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
//        label.text = "21/05/2022"
        label.font = label.font.withSize(15)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
//        label.text = "Some description"
        label.textColor = .black
        label.numberOfLines = 0
        
        return label
    }()
    
    // MARK: - Properties
    private let viewModel: NewsViewModelProtocol
    
    // MARK: - Life cycle
    init(viewModel: NewsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    // MARK: - Methods
    
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(descriptionLabel)
        view.addSubview(dateLabel)
        
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        dateLabel.text = viewModel.date
        
        if let data = viewModel.imageData, let image = UIImage(data: data) {
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "2")
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
    }
}
