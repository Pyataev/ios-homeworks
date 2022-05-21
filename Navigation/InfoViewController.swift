//
//  InfoViewController.swift
//  Navigation
//
//  Created by User on 11.04.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        buttonAlarm()
    }
    private func buttonAlarm() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.layer.cornerRadius = 12
        button.center = view.center
        button.setTitle("Alert", for: .normal)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(tapActionTwo), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func tapActionTwo() {
        let alert = UIAlertController(title: "закрыть Alarm?", message: "Вы точно хотите закрыть Alarm?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Выйти", style: .default) { _ in
            self.dismiss(animated: true)
            print("Вы покинули страницу")
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .default)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}



