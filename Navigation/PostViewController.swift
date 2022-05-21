//
//  PostViewController.swift
//  Navigation
//
//  Created by User on 03.04.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .lightText
        
        let myButton = UIBarButtonItem(image: UIImage(systemName: "clock"), style: .plain, target: self, action: #selector(didTapButton))
        
        self.navigationItem.rightBarButtonItem = myButton
        
    }
    
    
    @objc func didTapButton() {
        let infoVC = InfoViewController()
        infoVC.modalPresentationStyle = .fullScreen
        self.present(infoVC, animated: true)
    }
    
    
}



