//
//  EmailValidationView.swift
//  Lesson5-UIKit
//
//  Created by Светлана on 09.03.2022.
//

import UIKit

class EmailValidationView: View {

    lazy var validateButton: UIButton = buildButton(with: "Валидировать")
    lazy var backButton: UIButton = buildButton(with: "Назад")
    
    private lazy var emailCardView: UIView = buildCardView()
    private lazy var emailTextField: UITextField = buildTextView()
    private lazy var validationEmailLabel: UILabel = buildValidationLabel()
    
    override func selfInit() {
        super.selfInit()
        configureView()
    }
}

extension EmailValidationView {
    private func configureView() {
        addSubview(emailCardView)
        emailCardView.addSubview(emailTextField)
        emailCardView.addSubview(validateButton)
        emailCardView.addSubview(validationEmailLabel)
        
        emailTextField.placeholder = "Введите email"
        
        addSubview(backButton)
        
        NSLayoutConstraint.activate([
            emailCardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            emailCardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailCardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: emailCardView.topAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            
            validateButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            validateButton.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            validateButton.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            
            validationEmailLabel.topAnchor.constraint(equalTo: validateButton.bottomAnchor, constant: 16),
            validationEmailLabel.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            validationEmailLabel.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            validationEmailLabel.bottomAnchor.constraint(equalTo: emailCardView.bottomAnchor, constant: -16),
            
            backButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 36),
            backButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -36),
        ])
    }
}

extension EmailValidationView: ValidationViewProtocol {
    func getTextFromTextField() -> String {
        let text = emailTextField.text ?? ""
        return text
    }
    
    func setValidationText(isValid: Bool) {
        let text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        validationEmailLabel.text = text
    }
    
    func setValidationTextColor(isValid: Bool) {
        validationEmailLabel.textColor = isValid ? .systemGreen : .systemRed
    }
}
