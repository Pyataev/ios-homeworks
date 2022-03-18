//
//  InfoViewController.swift
//  Navigation
//
//  Created by User on 16.03.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func
    viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemYellow
        self.view.addSubview(alertButton)
        self.setupButton()
    }
    
    let alertButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = .systemRed
        button.setTitle("Показать alert", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupButton() {
        alertButton.addTarget(self, action: #selector(didAlertButton), for: .touchUpInside)
        self.alertButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.alertButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        self.alertButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        self.alertButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func didAlertButton() {
        let alert = UIAlertController(title: "Atention", message: "are you sure?", preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "Yes", style: .default, handler: {action in print("Yes")})
        let noButton = UIAlertAction(title: "No", style: .default, handler: {action in print("No")})
        alert.addAction(yesButton)
        alert.addAction(noButton)
        present (alert, animated: true, completion: nil)
    }
    
}

