//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by User on 20.05.2022.
//

import UIKit

protocol PostTableViewCellProtocol: AnyObject {
    func tapPosts(cell: PostTableViewCell)
    func tapLikes(cell: PostTableViewCell)
}

final class PostTableViewCell: UITableViewCell {
    
    weak var delegate: PostTableViewCellProtocol?
    private var tapLikesGestureRecognizer = UITapGestureRecognizer()
    private var tapPostsGestureRecognizer = UITapGestureRecognizer()
    
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
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        return imageView
    }()
    
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.text  = "Likes:"
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 16)
        label.preferredMaxLayoutWidth = self.frame.size.width
        label.textColor = .black
        label.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
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
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.authorLabel.text = nil
        self.postImageView.image = nil
        self.descriptionLabel.text = nil
        self.viewsLabel.text = nil
        self.likesLabel.text = nil
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.stackView)
        self.backView.addSubview(self.authorLabel)
        self.backView.addSubview(self.postImageView)
        self.backView.addSubview(self.descriptionLabel)
        self.stackView.addArrangedSubview(self.likesLabel)
        self.stackView.addArrangedSubview(self.viewsLabel)
        
        
        NSLayoutConstraint.activate(
            backViewConstraints() +
            authorLabelConstraints() +
            imageConstraints() +
            descriptionLabelConstraints() +
            stackViewConstraints()
        )
    }
    
    private func backViewConstraints() -> [NSLayoutConstraint] {
        
        return [
            backView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ]
    }
    
    private func authorLabelConstraints() -> [NSLayoutConstraint] {
        
        return [
            authorLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16)
        ]
    }
    
    private func imageConstraints() -> [NSLayoutConstraint] {
        
        return [
            postImageView.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalTo: self.backView.widthAnchor, multiplier: 1.0)
        ]
    }
    
    private func descriptionLabelConstraints() -> [NSLayoutConstraint] {
        
        return [
            descriptionLabel.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16)
        ]
    }
    
    private func stackViewConstraints() -> [NSLayoutConstraint] {
        
        return [
            stackView.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -16)
        ]
    }
}

extension PostTableViewCell: Setupable {
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }
        self.authorLabel.text = viewModel.author
        self.postImageView.image = UIImage(named: viewModel.image)
        self.descriptionLabel.text = viewModel.description
        self.likesLabel.text = "Likes: " + String(viewModel.likes)
        self.viewsLabel.text = "Views: " + String(viewModel.views)
    }
}

extension PostTableViewCell {
    private func setupGesture() {
        self.tapLikesGestureRecognizer.addTarget(self, action: #selector(self.likesHandleTapGesture(_:)))
        self.likesLabel.addGestureRecognizer(self.tapLikesGestureRecognizer)
        self.likesLabel.isUserInteractionEnabled = true
        self.tapPostsGestureRecognizer.addTarget(self, action: #selector(self.postsHandleTapGesture(_:)))
        self.postImageView.addGestureRecognizer(self.tapPostsGestureRecognizer)
        self.postImageView.isUserInteractionEnabled = true
    }
    
    @objc func likesHandleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapLikesGestureRecognizer === gestureRecognizer else { return }
        delegate?.tapLikes(cell: self)
    }
    
    @objc func postsHandleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapPostsGestureRecognizer === gestureRecognizer else { return }
        delegate?.tapPosts(cell: self)
    }
}



