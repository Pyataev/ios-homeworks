//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by User on 13.04.2022.
//

import UIKit


protocol ProfileHeaderViewProtocol: AnyObject {
    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void)
}

class ProfileHeaderView: UIView, UITextFieldDelegate {
    
    private lazy var pictureImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "Kote")
        imageView.frame = CGRect(x: 16,y: 16,width: 140,height: 140)
        imageView.layer.borderWidth = 3.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 70
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = true
        
        return imageView
    }()
    
    private lazy var NameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 180, y: 27, width: 135, height: 30)
        label.text = "Lazy Cat"
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = true
        
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "what is waiting"
        label.textColor = .gray
        label.font = UIFont(name: "Helvetica-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите статус"
        textField.backgroundColor = .white
        textField.font = UIFont(name: "Helvetica-Regular", size: 15)
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .center
        textField.clearButtonMode = .whileEditing
        textField.clearButtonMode = .unlessEditing
        textField.clearButtonMode = .always
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var statusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = .systemBlue
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(self.didTapStatusButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawSelf() {
        self.addSubview(self.pictureImageView)
        self.addSubview(self.NameLabel)
        self.addSubview(self.statusLabel)
        self.addSubview(self.textField)
        self.addSubview(self.statusButton)
        self.textField.delegate = self
        
        NSLayoutConstraint.activate([
            statusButton.leadingAnchor.constraint(equalTo: self.pictureImageView.leadingAnchor),
            statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusButton.topAnchor.constraint(equalTo: self.pictureImageView.bottomAnchor, constant: 36),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            textField.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor),
            textField.leftAnchor.constraint(equalTo: self.pictureImageView.rightAnchor, constant: 16),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusLabel.leadingAnchor.constraint(equalTo: self.NameLabel.leadingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: self.statusButton.bottomAnchor, constant: -106)
        ])
    }
    
    private var statusText: String? = nil
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
    
    @objc private func didTapStatusButton() {
        guard textField.text != "" else {
            textField.vibrate()
            return
        }
        statusText = textField.text!
        statusLabel.text = "\(statusText ?? "")"
        self.textField.text = nil
        self.endEditing(true)
    }
}

extension UIView {
    func vibrate() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 5.0, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 5.0, y: self.center.y))
        layer.add(animation, forKey: "position")
    }
}

