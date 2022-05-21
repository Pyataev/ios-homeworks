//
//  PostView.swift
//  Navigation
//
//  Created by User on 21.05.2022.
//

import UIKit

class PostView: UIView {
    
    struct ViewModel: ViewModelProtocol {
        var author, description, image: String
        var likes: Int
        var views: Int
    }
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.setContentCompressionResistancePriority(UILayoutPriority(999), for: .vertical)
        label.preferredMaxLayoutWidth = self.frame.size.width
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.preferredMaxLayoutWidth = self.frame.size.width
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.setContentCompressionResistancePriority(UILayoutPriority(999), for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.setContentCompressionResistancePriority(UILayoutPriority(999), for: .vertical)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.text  = "Likes: "
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16)
        label.preferredMaxLayoutWidth = self.frame.size.width
        label.textColor = .black
        label.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(500), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.text  = "Views: "
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16)
        label.preferredMaxLayoutWidth = self.frame.size.width
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(UILayoutPriority(500), for: .vertical)
        return label
    }()
    
    private lazy var returnButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "clear")
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.setBackgroundImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(self.backView)
        self.addSubview(self.returnButton)
        self.backView.addSubview(self.authorLabel)
        self.backView.addSubview(self.postImageView)
        self.backView.addSubview(self.descriptionLabel)
        self.backView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.likesLabel)
        self.stackView.addArrangedSubview(self.viewsLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {

        NSLayoutConstraint.activate([
            backView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            backView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                                  
            authorLabel.topAnchor.constraint(equalTo: self.backView.topAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16),
                                                  
            postImageView.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: 4),
            postImageView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalTo: self.backView.widthAnchor, multiplier: 1.0),
                                                  
            descriptionLabel.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16),
                                                  
            stackView.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -16),
                                                  
            returnButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            returnButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            returnButton.heightAnchor.constraint(equalToConstant: 28),
            returnButton.widthAnchor.constraint(equalToConstant: 28)])
    }
    
    @objc private func didTapButton() {
        removeFromSuperview()
    }
}

extension PostView: Setupable {
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }
        self.authorLabel.text = viewModel.author
        self.postImageView.image = UIImage(named: viewModel.image)
        self.descriptionLabel.text = viewModel.description
        self.likesLabel.text = "Likes: " + String(viewModel.likes)
        self.viewsLabel.text = "Views: " + String(viewModel.views)
    }
}

