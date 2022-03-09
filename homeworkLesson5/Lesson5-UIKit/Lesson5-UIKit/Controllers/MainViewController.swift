//
//  MainViewController.swift
//  Lesson5-UIKit
//
//  Created by Светлана on 09.03.2022.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    private lazy var validateNameBtn: UIButton = buildButton(with: "Проверить имя")
    private lazy var validateEmailBtn: UIButton = buildButton(with: "Проверить почту")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBtnView()
    }
}

// MARK: - Private Methods

extension MainViewController {
    
    private func buildButton(with title: String) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 25
        btn.addTarget(self, action: #selector(didTapCheckBtn(_:)), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }
    
    private func configureBtnView(){
        view.backgroundColor = .systemBackground
        view.addSubview(validateNameBtn)
        view.addSubview(validateEmailBtn)

        NSLayoutConstraint.activate([
            validateNameBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            validateNameBtn.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            validateNameBtn.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            validateNameBtn.heightAnchor.constraint(equalToConstant: 50),
            
            validateEmailBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            validateEmailBtn.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 70),
            validateEmailBtn.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            validateEmailBtn.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    @objc
    private func didTapCheckBtn(_ sender: UIButton) {
        switch sender {
        case validateEmailBtn:
            let vc = EmailValidationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case validateNameBtn:
            let vc = NameValidationViewController()
            self.present(vc, animated: true, completion: nil)
        default:
            print("None of the buttons tapped")
        }
    }
}
