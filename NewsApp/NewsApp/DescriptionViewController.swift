//
//  DescriptionViewController.swift
//  NewsApp
//
//  Created by Виктор Назаров on 1.05.23.
//

import Foundation
import UIKit

final class DescriptionViewController: UIViewController {
    // MARK: - GUI variables
    private lazy var publicationLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textColor = .black
        label.textAlignment = .center
        label.font = label.font.withSize(25)
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "1") ?? UIImage.add
        

        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Some description"
        label.textColor = .black
        
        return label
    }()
    
    private lazy var dataPublicationLabel: UILabel = {
        let label = UILabel()
        label.text = "21/05/2022"
        label.textColor = .black
        
        return label
    }()
    
    
    
    // MARK: - Properties
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    // MARK: - Methods
    
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(publicationLabel)
        view.addSubview(imageView)
        view.addSubview(descriptionLabel)
        view.addSubview(dataPublicationLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        publicationLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(publicationLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        dataPublicationLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
