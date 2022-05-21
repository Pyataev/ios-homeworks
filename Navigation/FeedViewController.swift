//
//  FeedViewController.swift
//  Navigation
//
//  Created by User on 03.04.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    struct Post {
        var title: String
    }
    
    let onePost = Post.init(title: "Пост")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeButton()
        
    }
    
    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.layer.cornerRadius = 12
        button.center = view.center
        button.setTitle("перейти на пост", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(tapActionOne), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Лента"
    }
    
    
    @objc private func tapActionOne() {
        let post = PostViewController()
        post.navigationItem.title = onePost.title
        
        navigationController?.pushViewController(post, animated: true)
        
    }
    
}
