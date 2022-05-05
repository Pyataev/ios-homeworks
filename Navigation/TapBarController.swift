//
//  TapBarController.swift
//  Navigation
//
//  Created by User on 03.04.2022.
//

import UIKit

class TapBarController: UITabBarController {
    
    
    let lenta = FeedViewController()
    let profile = LogInViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        
    }
    
    private func setupController() {
        let lentaNC = UINavigationController(rootViewController: lenta)
        let profileNC = UINavigationController(rootViewController: profile)
        
        lenta.tabBarItem.title = "Lenta"
        lenta.tabBarItem.image = UIImage(systemName: "house")
        profile.tabBarItem.title = "Profile"
        profile.tabBarItem.image = UIImage(systemName: "person")
        profile.navigationItem.title = "Профиль"
       
        viewControllers = [lentaNC, profileNC]
    }
    

   
    
}
