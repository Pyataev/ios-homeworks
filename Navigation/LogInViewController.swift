//
//  LogInViewController.swift
//  Navigation
//
//  Created by User on 28.04.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
        self.setUpView()
        self.tapGesture()
        self.infoTextField.delegate = self
        self.passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(LogInViewController.kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(LogInViewController.kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func kbWillShow(notification: NSNotification) {
        
        if let kbFrameSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.height * 0.1)
            scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbFrameSize.height, right: 0)
        }
    }
    
    @objc func kbWillHide(notification: NSNotification) {
        scrollView.contentOffset = CGPoint.zero
    }
    
    private lazy var logoImageView: UIImageView = {
        
        var imageView = UIImageView()     
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
    private lazy var warningLabel: UILabel = {
        let label = UILabel()
        label.text = "Недостаточно символов"
        label.textColor = .black
        label.isHidden = true
        label.font = UIFont(name: "Helvetica-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    private lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var infoTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Email"
        textField.font = UIFont.systemFont(ofSize: 16)
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.tintColor = .lightGray
        textField.autocapitalizationType = .none
        textField.textColor = .black
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.clearButtonMode = .whileEditing
        textField.clearButtonMode = .unlessEditing
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Password"
        textField.font = UIFont.systemFont(ofSize: 16)
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.tintColor = .lightGray
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.textColor = .black
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.clearButtonMode = .whileEditing
        textField.clearButtonMode = .unlessEditing
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var logInButton: UIButton = {      // кнопка
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        let image = UIImage(named: "blue_pixel")
        button.setBackgroundImage(image, for: .normal)
        button.backgroundColor = UIColor(named: "Color")
        button.addTarget(self, action: #selector(self.didTapLogInButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private var topButtonConstraint: NSLayoutConstraint?
    
    private func setUpView() {
        self.view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        self.scrollView.addSubview(textFieldStackView)
        self.scrollView.addSubview(logoImageView)
        self.scrollView.addSubview(logInButton)
        
        self.textFieldStackView.addArrangedSubview(infoTextField)
        self.textFieldStackView.addArrangedSubview(passwordTextField)
        
        topButtonConstraint?.priority = UILayoutPriority(rawValue: 999)
        
        
        NSLayoutConstraint.activate([
            logoImageView.bottomAnchor.constraint(equalTo: self.textFieldStackView.topAnchor, constant: -70),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            
            textFieldStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            textFieldStackView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            textFieldStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textFieldStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            infoTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            logInButton.topAnchor.constraint(equalTo: self.textFieldStackView.bottomAnchor, constant: 56),
            logInButton.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 16),
            self.topButtonConstraint,
            logInButton.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -16),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  -100),
            logInButton.heightAnchor.constraint(equalToConstant: 50)].compactMap( {$0} ))
    }
    
    private func tapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(view.endEditing))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func validPassword(userPassword : String) -> Bool {
        let passwordReg =  (".{6,}")
        let passwordTesting = NSPredicate(format: "SELF MATCHES %@", passwordReg)
        return passwordTesting.evaluate(with: userPassword)
    }
    
    func isValidEmail(userEmail: String) -> Bool {
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: userEmail)
    }
    
    @objc private func didTapLogInButton() {
        if logInButton.isSelected {
            logInButton.alpha = 0.8
        } else if logInButton.isHighlighted {
            logInButton.alpha = 0.8
        } else if !logInButton.isEnabled {
            logInButton.alpha = 0.8
        } else {
            logInButton.alpha = 1
        }
        
        let topLabelConstraint = self.warningLabel.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 10)
        let leadingLabelConstraint = self.warningLabel.leadingAnchor.constraint(equalTo: self.textFieldStackView.leadingAnchor)
        let heightLabelConstraint = self.warningLabel.heightAnchor.constraint(equalToConstant: 40)
        let trailingLabelConstraint = self.warningLabel.trailingAnchor.constraint(equalTo: self.textFieldStackView.trailingAnchor)
        
        self.topButtonConstraint = self.logInButton.topAnchor.constraint(equalTo: self.warningLabel.bottomAnchor, constant: 16)
        
        let email = isValidEmail(userEmail: infoTextField.text!)
        if(email == false) {
            let alert = UIAlertController(title: "Внимание!", message: "Некорректный email", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        let password = validPassword(userPassword: passwordTextField.text!)
        if(password == false) {
            self.warningLabel.isHidden = false
            self.scrollView.addSubview(self.warningLabel)
            self.topButtonConstraint?.isActive = false
            NSLayoutConstraint.activate([topLabelConstraint, leadingLabelConstraint, trailingLabelConstraint, heightLabelConstraint, topButtonConstraint].compactMap( {$0} ))
        } else {
            self.warningLabel.removeFromSuperview()
            NSLayoutConstraint.deactivate([topLabelConstraint, leadingLabelConstraint, trailingLabelConstraint, heightLabelConstraint].compactMap( {$0} ))
            self.warningLabel.isHidden = true
        }
        
        if self.infoTextField.text == "" {
            self.infoTextField.backgroundColor = .systemRed
        } else if passwordTextField.text == "" {
            self.passwordTextField.backgroundColor = .systemRed
        } else if self.infoTextField.text == "pyataevaleksei@gmail.com" && passwordTextField.text == "password" {
            
            let profileVC = ProfileViewController()
            self.navigationController?.pushViewController(profileVC, animated: true)
        } else {
            let alert = UIAlertController(title: "Внимание!", message: "Данные введены неверно", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
