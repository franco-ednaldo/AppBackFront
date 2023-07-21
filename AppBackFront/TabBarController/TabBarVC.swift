//
//  TabBarVC.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 21/07/23.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }
    
    
    private func setupTabBar() {
        let home = UINavigationController(rootViewController: HomeVC())
        let second = UINavigationController(rootViewController: HomeVC())
        setViewControllers([home, second], animated: true)
        
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
        tabBar.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        
        guard let items = tabBar.items else { return }
        items[0].image = UIImage(systemName: "trash")
        items[0].title = "trash"
        
        items[1].image = UIImage(systemName: "person")
        items[1].title = "person"
        
        
    }

}
