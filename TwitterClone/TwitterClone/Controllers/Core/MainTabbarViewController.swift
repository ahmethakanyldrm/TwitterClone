//
//  ViewController.swift
//  TwitterClone
//
//  Created by AHMET HAKAN YILDIRIM on 27.07.2023.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let home = UINavigationController(rootViewController: HomeViewController())
        let search = UINavigationController(rootViewController: SearchViewController())
        let notification = UINavigationController(rootViewController: NotificationViewController())
        let messages = UINavigationController(rootViewController: DirectMessagesViewController())
        
        home.tabBarItem.image = UIImage(systemName: "house")
        home.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        search.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        notification.tabBarItem.image = UIImage(systemName: "bell")
        notification.tabBarItem.selectedImage = UIImage(systemName: "bell.fill")
        
        messages.tabBarItem.image = UIImage(systemName: "envelope")
        messages.tabBarItem.selectedImage = UIImage(systemName: "envelope.fill")
        
        setViewControllers([home,search,notification,messages], animated: true)
        
        
        
    }


}

