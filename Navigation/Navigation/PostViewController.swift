//
//  PostViewController.swift
//  Navigation
//
//  Created by User on 16.03.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        
        let myButton = UIBarButtonItem(image: UIImage(systemName: "alarm"), style: .plain, target: self, action: #selector(didTapButton))
        
        self.navigationItem.rightBarButtonItem = myButton
    }
    
    @objc func didTapButton() {
        let infoVC = InfoViewController()
        infoVC.modalPresentationStyle = .fullScreen
        self.present(infoVC, animated: true)
    }
    
}
