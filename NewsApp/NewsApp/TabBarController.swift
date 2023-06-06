//
//  TabBarController.swift
//  NewsApp
//
//  Created by Виктор Назаров on 27.04.23.
//

import UIKit
import Foundation

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.tintColor = .black
        setupViewController()
    }
    
    private func setupViewController() {
        viewControllers = [
            setupNavigationController(rootViewController: GeneralViewController(viewModel: GeneralViewModel()), title: "General", image: "newspaper"),
            setupNavigationController(rootViewController: BusinessViewController(viewModel: BusinessViewModel()), title: "Business", image: "briefcase"),
            setupNavigationController(rootViewController: TechnologyViewController(viewModel: TechnologyViewModel()), title: "Technology", image: "gyroscope")
        ]
    }
    
    private func setupNavigationController (rootViewController: UIViewController, title: String, image: String) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(systemName: image)
        rootViewController.navigationItem.title = title
        
        return navigationController
    }
    
    private func setupTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        tabBar.scrollEdgeAppearance = appearance
        
        view.tintColor = .black
    }
}
