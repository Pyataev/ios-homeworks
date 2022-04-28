//
//  ProfileViewController.swift
//  Navigation
//
//  Created by User on 03.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    
    private lazy var uiButton: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()
    
    override func viewWillLayoutSubviews() {
        self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(self.uiButton)
        self.profileHeaderView.backgroundColor = .lightGray
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),   // верх
            profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),  // лево
            profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),    // право
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),  // высота
            
            // кнопка
            uiButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),  // лево
            uiButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),    // право
            uiButton.heightAnchor.constraint(equalToConstant: 50),
            uiButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)  // низ кнопки
        ])
    }
}
