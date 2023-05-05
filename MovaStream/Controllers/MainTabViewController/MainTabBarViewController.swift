//
//  MainViewController.swift
//  MovaStream
//
//  Created by HauNguyen on 26/04/2566 BE.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.setupView()
        self.tabBarConfig()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        
        let homeVC = self.createNavigation(
            HomeViewController(),
            "home",
            "home-fill",
            "Home", 0
        )
        
        let exploreVC = self.createNavigation(
            ExploreViewController(),
            "navigation",
            "navigation-fill",
            "Explore", 1
        )
        
        let myListVC = self.createNavigation(
            MyListViewController(),
            "bookmark",
            "bookmark-fill",
            "My list", 2
        )
        
        let downloadVC = self.createNavigation(
            DownloadViewController(),
            "cloud-download-alt",
            "cloud-download-alt-fill",
            "Download", 3
        )
        
        let profileVC = self.createNavigation(
            ProfileViewController(),
            "user",
            "user-fill",
            "User", 4
        )
        
        self.setViewControllers([homeVC, exploreVC, myListVC, downloadVC, profileVC], animated: true)
        self.selectedIndex = 0
        self.selectedViewController = homeVC
    }
    
    
    private func tabBarConfig() {
        self.tabBar.tintColor = .label // Selected item color
    }
    
    private func createNavigation(_ viewController: UIViewController,_ iconNameUnSelected: String,_ iconNameSelected: String,_ title: String,_ tag: Int) -> UINavigationController {
        let vc = UINavigationController(rootViewController: viewController)
        vc.tabBarItem = self.tabItem(iconNameUnSelected, iconNameSelected, title)
        vc.tabBarItem.tag = tag
        return vc
    }
    
    private func tabItem(_ iconNameUnSelected: String,_ iconNameSelected: String,_ title: String) -> UITabBarItem {
        let tabBarItem = UITabBarItem()
        tabBarItem.image = UIImage(named: iconNameUnSelected)?.resize(to: 24)
        tabBarItem.selectedImage = UIImage(named: iconNameSelected)?.resize(to: 24)
        tabBarItem.title = title
        return tabBarItem
    }

}

extension MainTabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("\(tabBarController.selectedIndex)")
    }
    
}
