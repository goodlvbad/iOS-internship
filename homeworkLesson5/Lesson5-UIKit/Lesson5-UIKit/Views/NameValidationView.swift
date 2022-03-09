//
//  NameValidationView.swift
//  Lesson5-UIKit
//
//  Created by Светлана on 09.03.2022.
//

import UIKit

class NameValidationView: View {
    
    lazy var validateButton: UIButton = buildButton(with: "Валидировать")
    lazy var backButton: UIButton = buildButton(with: "Назад")
    
    private lazy var nameCardView: UIView = buildCardView()
    private lazy var nameTextField: UITextField = buildTextView()
    private lazy var validationNameLabel: UILabel = buildValidationLabel()
    
    override func selfInit() {
        super.selfInit()
        configureView()
    }
}

extension NameValidationView {
    private func configureView() {
        addSubview(nameCardView)
        nameCardView.addSubview(nameTextField)
        nameCardView.addSubview(validateButton)
        nameCardView.addSubview(validationNameLabel)
        
        nameTextField.placeholder = "Введите имя"
        
        addSubview(backButton)
        
        NSLayoutConstraint.activate([
            nameCardView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            nameCardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameCardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: nameCardView.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -16),
            
            validateButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            validateButton.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 16),
            validateButton.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -16),
            
            validationNameLabel.topAnchor.constraint(equalTo: validateButton.bottomAnchor, constant: 16),
            validationNameLabel.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 16),
            validationNameLabel.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -16),
            validationNameLabel.bottomAnchor.constraint(equalTo: nameCardView.bottomAnchor, constant: -16),
            
            backButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 36),
            backButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -36),
        ])
    }
}

extension NameValidationView: ValidationViewProtocol {
    
    func getTextFromTextField() -> String {
        let text = nameTextField.text ?? ""
        return text
    }
    
    func setValidationText(isValid: Bool) {
        let text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        validationNameLabel.text = text
    }
    
    func setValidationTextColor(isValid: Bool) {
        validationNameLabel.textColor = isValid ? .systemGreen : .systemRed
    }
}
