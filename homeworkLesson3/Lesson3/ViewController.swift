//
//  ViewController.swift
//  Lesson3
//
//  Created by Светлана on 22.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var nameCardView: UIView = buildCardView()
    private lazy var emailCardView: UIView = buildCardView()
    
    private lazy var nameTextField: UITextField = buildTextView()
    private lazy var emailTextField: UITextField = buildTextView()
    
    private lazy var validateNameButton: UIButton = buildValidateButton()
    private lazy var validateEmailButton: UIButton = buildValidateButton()
    
    private lazy var validationNameLabel: UILabel = buildValidationLabel()
    private lazy var validationEmailLabel: UILabel = buildValidationLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

//MARK: - Private Methods

extension ViewController {
    private func buildCardView() -> UIView {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }
    
    private func buildTextView() -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    private func buildValidateButton() -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Валидировать", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapValidateButton(_:)), for: .touchUpInside)
        return button
    }
    
    private func buildValidationLabel() -> UILabel {
        let label = UILabel()
        label.text = "Ожидаю валидации..."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        view.addSubview(nameCardView)
        nameCardView.addSubview(nameTextField)
        nameCardView.addSubview(validateNameButton)
        nameCardView.addSubview(validationNameLabel)
        
        nameTextField.placeholder = "Введите имя"

        NSLayoutConstraint.activate([
            nameCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: nameCardView.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -16),
            
            validateNameButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            validateNameButton.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 16),
            validateNameButton.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -16),
            
            validationNameLabel.topAnchor.constraint(equalTo: validateNameButton.bottomAnchor, constant: 16),
            validationNameLabel.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 16),
            validationNameLabel.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -16),
            validationNameLabel.bottomAnchor.constraint(equalTo: nameCardView.bottomAnchor, constant: -16),
        ])
        
        view.addSubview(emailCardView)
        emailCardView.addSubview(emailTextField)
        emailCardView.addSubview(validateEmailButton)
        emailCardView.addSubview(validationEmailLabel)
        
        emailTextField.placeholder = "Введите email"

        NSLayoutConstraint.activate([
            emailCardView.topAnchor.constraint(equalTo: nameCardView.bottomAnchor, constant: 20),
            emailCardView.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor),
            emailCardView.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailCardView.topAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            
            validateEmailButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            validateEmailButton.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            validateEmailButton.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            
            validationEmailLabel.topAnchor.constraint(equalTo: validateEmailButton.bottomAnchor, constant: 16),
            validationEmailLabel.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            validationEmailLabel.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            validationEmailLabel.bottomAnchor.constraint(equalTo: emailCardView.bottomAnchor, constant: -16),
        ])
        
    }
    
    private func setValidationText(isValid: Bool) -> String {
        return isValid ? "Валидация прошла успешно" : "В поле ошибка"
    }
    
    private func setValidationTextColor(isValid: Bool) -> UIColor {
        return isValid ? .systemGreen : .systemRed
    }
    
    @objc private func didTapValidateButton(_ sender: UIButton) {
        switch sender {
        case validateEmailButton:
            let regExString = "[A-Za-z0-9]{2,}+@{1}+[a-z0-9]{2,}+\\.{1}+[a-z]{2,}"
            let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
            let isValid = predicate.evaluate(with: emailTextField.text)
            validationEmailLabel.text = setValidationText(isValid: isValid)
            validationEmailLabel.textColor = setValidationTextColor(isValid: isValid)
        case validateNameButton:
            let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
            let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
            let isValid = predicate.evaluate(with: nameTextField.text)
            validationNameLabel.text = setValidationText(isValid: isValid)
            validationNameLabel.textColor = setValidationTextColor(isValid: isValid)
        default:
            print("another button tapped, do something else")
        }
    }
}
