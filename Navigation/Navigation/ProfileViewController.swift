//
//  ProfileViewController.swift
//  Navigation
//
//  Created by User on 16.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var heightConstraint: NSLayoutConstraint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupNavigationBar()
        self.viewWillLayoutSubviews()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Profile"
    }
    override func viewWillLayoutSubviews() {}
}
